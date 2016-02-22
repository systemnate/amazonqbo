class AddSummaryToAmazonStatements < ActiveRecord::Migration
  def change
    add_column :amazon_statements, :summary, :text
  end
end
