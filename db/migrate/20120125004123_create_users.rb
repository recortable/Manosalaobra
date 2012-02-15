class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :slug, limit: 50
      t.string :email, limit: 60
      t.string :password_digest, limit: 300
      t.string :role, limit: 10, after: :password
      t.timestamps
    end

  end
end
