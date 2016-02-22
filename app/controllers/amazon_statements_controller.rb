class AmazonStatementsController < ApplicationController
  def index
    @amazon_statements = AmazonStatement.all
  end
end
