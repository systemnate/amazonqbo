class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :primary_marketplace_id
      t.string :merchant_id
      t.string :auth_token
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
