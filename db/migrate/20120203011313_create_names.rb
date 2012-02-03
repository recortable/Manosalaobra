class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |table|
      table.string :proposed_name, limit: 50
      table.integer :votes_sum, default: 1
      table.timestamps
    end
  end
end
