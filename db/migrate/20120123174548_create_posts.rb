class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |table|
      table.string :title, limit: 300
      table.text :body
      table.timestamps
    end
  end
end
