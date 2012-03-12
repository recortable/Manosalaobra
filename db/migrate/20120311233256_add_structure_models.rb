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
      t.string :title, limit: 300
      t.string :slug, limit: 300
      t.integer :user_id
      t.integer :phase_id
      t.integer :parent_id
      t.text :body_context
      t.text :body_description
      t.text :body_solutions
      t.text :settings
      t.timestamps
    end
    add_index :problems, :slug
    add_index :problems, :user_id
    add_index :problems, :phase_id
    add_index :problems, :parent_id

    create_table :solutions do |t|
      t.string :title, limit: 200
      t.string :slug, limit: 200
      t.integer :user_id
      t.integer :phase_id
      t.integer :problem_id
      t.text :body
      t.text :settings
      t.timestamps
    end
    add_index :solutions, :slug
    add_index :solutions, :user_id
    add_index :solutions, :phase_id
    add_index :solutions, :problem_id

    create_table :groups do |t|
      t.string :name, limit: 100
      t.string :slug, limit: 100
      t.integer :user_id
      t.text :body
      t.timestamps
    end
    add_index :groups, :slug
    add_index :groups, :user_id

    create_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
    add_index :memberships, :user_id
    add_index :memberships, :group_id

  end
end
