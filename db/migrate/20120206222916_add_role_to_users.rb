class AddRoleToUsers < ActiveRecord::Migration
  def change
    change_table :users do |table|
      table.string :role, limit: 10, after: :password
    end
  end
end
