class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :mail, limit: 60
      t.string :password, limit: 60 
      t.timestamps
    end
  end
end
