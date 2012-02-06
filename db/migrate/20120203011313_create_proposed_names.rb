class CreateProposedNames < ActiveRecord::Migration
  def change
    create_table :proposed_names do |table|
      table.string :value, limit: 50
      table.string :request_ip, limit: 20
      table.integer :votes_count, default: 0
      table.integer :votes_value, default: 0
      table.timestamps
    end
  end
end
