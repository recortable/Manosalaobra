class AddStructureModels < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name, limit: 100
      t.string :description, limit: 300
      t.string :token, limit: 50
      t.integer :position
      t.timestamps
    end
    add_index :phases, :token

    create_table :problems do |t|
      t.string :title
      t.integer :user_id
      t.integer :phase_id
      t.integer :parent_id
      t.text :body_context
      t.text :body_description
      t.text :body_solutions
      t.text :settings
      t.timestamps
    end

  end
end
