class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.integer :user_id
      table.integer :post_id
      table.string :body, limit: 300
      table.timestamps
    end
  end
end
