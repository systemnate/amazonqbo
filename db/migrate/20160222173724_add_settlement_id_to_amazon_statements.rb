class AddSettlementIdToAmazonStatements < ActiveRecord::Migration
  def change
    add_column :amazon_statements, :settlement_id, :string
  end
end
