class AddUserToAmazonStatements < ActiveRecord::Migration
  def change
    add_reference :amazon_statements, :user, index: true, foreign_key: true
  end
end
