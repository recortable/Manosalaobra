class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :proposed_name
      t.string :request_ip, limit: 20
      t.timestamps
    end
  end
end
