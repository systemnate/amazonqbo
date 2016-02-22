class AmazonStatementsController < ApplicationController
  before_action :check_user

  def index
    @amazon_statements = AmazonStatement.all.order("period DESC")
  end

  def fetch
    client = set_client
    begin
      reports = client.get_report_list
      next_token = reports.next_token
      fetch_reports(client, reports)
      fetch_rest_of_reports(client, next_token)
    rescue => e
      logger.fatal(e.to_s)
      redirect_to user_amazon_statements_path(current_user)
    end
    redirect_to user_amazon_statements_path(current_user)
  end

  private

  def set_client
    MWS::Reports::Client.new(
      primary_marketplace_id: current_user.configuration.primary_marketplace_id,
      merchant_id: current_user.configuration.merchant_id,
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      auth_token: current_user.configuration.auth_token
    )
  end

  def fetch_reports(client, reports, next_token = false)
    report_param = { true =>  { 1 => "GetReportListByNextTokenResponse", 2 => "GetReportListByNextTokenResult" },
                     false => { 1 => "GetReportListResponse", 2 => "GetReportListResult" } }
    reports.xml[report_param[next_token][1]][report_param[next_token][2]]['ReportInfo'].each do |report|
      type = report['ReportType']
      if type.include?('_GET_V2_SETTLEMENT_REPORT_DATA_XML_')
        report_id = report['ReportId']
        item_to_add = client.get_report(report_id).xml['AmazonEnvelope']['Message']['SettlementReport']
        add_statement_to_db(item_to_add)
      else
        next
      end
    end
  end

  def add_statement_to_db(item_to_add)
    if AmazonStatement.where(settlement_id: item_to_add['SettlementData']['AmazonSettlementID']).blank?
      period = item_to_add['SettlementData']['StartDate'].gsub(/T.+/, '') + ' - ' + item_to_add['SettlementData']['EndDate'].gsub(/T.+/, '')
      deposit_total = item_to_add['SettlementData']['TotalAmount']['__content__']
      status = 'NOT_PROCESSED'
      summary = item_to_add.to_s
      settlement_id = item_to_add['SettlementData']['AmazonSettlementID']
      AmazonStatement.create!(period: period, deposit_total: deposit_total, status: status, summary: summary, settlement_id: settlement_id, user: current_user)
    end
  end

  def fetch_rest_of_reports(client, next_token)
    loop do
      break if next_token == false
      reports = client.get_report_list_by_next_token(next_token)
      next_token = reports.next_token
      fetch_reports(client, reports, true)
    end
  end
end
