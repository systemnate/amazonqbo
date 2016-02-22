class CreateAmazonStatements < ActiveRecord::Migration
  def change
    create_table :amazon_statements do |t|
      t.string :period
      t.decimal :beginning_balance
      t.decimal :product_charges
      t.decimal :promo_rebates
      t.decimal :amazon_fees
      t.decimal :other
      t.decimal :deposit_total
      t.string :status

      t.timestamps null: false
    end
  end
end
