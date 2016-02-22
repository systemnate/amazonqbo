class RemoveColumnsFromAmazonStatements < ActiveRecord::Migration
  def change
    remove_column :amazon_statements, :beginning_balance, :decimal
    remove_column :amazon_statements, :product_charges, :decimal
    remove_column :amazon_statements, :promo_rebates, :decimal
    remove_column :amazon_statements, :amazon_fees, :decimal
    remove_column :amazon_statements, :other, :decimal
  end
end
