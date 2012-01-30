class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |table|
      table.integer :user_id
      table.integer :post_id
      table. integer :rating
      table.timestamps
    end
  end
end
