class AddStructureModels < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]

    create_table :phases do |t|
      t.string :name_es, limit: 50
      t.string :name_ca, limit: 50
      t.string :description_es, limit: 300
      t.string :description_ca, limit: 300
      t.string :slug_es, limit: 50
      t.string :slug_ca, limit: 50
      t.integer :position
      t.timestamps
    end
    add_index :phases, :slug_es
    add_index :phases, :slug_ca

    create_table :problems do |t|
      t.string :title_es, limit: 300
      t.string :title_ca, limit: 300
      t.string :slug_es, limit: 300
      t.string :slug_ca, limit: 300
      t.integer :user_id
      t.integer :phase_id
      t.integer :parent_id
      t.integer :group_id
      t.boolean :published, default: true
      t.text :body_context_es
      t.text :body_context_ca
      t.text :body_description_es
      t.text :body_description_ca
      t.text :body_solutions_es
      t.text :body_solutions_ca
      t.integer :solutions_count, default: 0
      t.text :settings
      t.timestamps
    end
    add_index :problems, :slug_es
    add_index :problems, :slug_ca
    add_index :problems, :user_id
    add_index :problems, :phase_id
    add_index :problems, :parent_id

    create_table :solutions do |t|
      t.string :title_es, limit: 200
      t.string :title_ca, limit: 200
      t.string :slug_es, limit: 200
      t.string :slug_ca, limit: 200
      t.integer :user_id
      t.integer :phase_id
      t.integer :problem_id
      t.integer :group_id
      t.boolean :published, default: true
      t.text :body_es
      t.text :body_ca
      t.integer :examples_count, default: 0
      t.text :settings
      t.timestamps
    end
    add_index :solutions, :slug_es
    add_index :solutions, :slug_ca
    add_index :solutions, :user_id
    add_index :solutions, :phase_id
    add_index :solutions, :problem_id

    create_table :examples do |t|
      t.string :title_es, limit: 200
      t.string :title_ca, limit: 200
      t.string :slug_es, limit: 200
      t.string :slug_ca, limit: 200
      t.integer :user_id
      t.integer :group_id
      t.boolean :published, default: true
      t.text :body_es
      t.text :body_ca
      t.integer :solutions_count, default: 0
      t.text :settings
      t.timestamps
    end
    add_index :examples, :slug_es
    add_index :examples, :slug_ca
    add_index :examples, :user_id
    add_index :examples, :group_id

    create_table :solution_examples do |t|
      t.belongs_to :user
      t.integer :solution_id
      t.integer :example_id
      t.text :body
      t.timestamps
    end
    add_index :solution_examples, :solution_id
    add_index :solution_examples, :example_id
    add_index :solution_examples, :user_id

    create_table :questions do |t|
      t.belongs_to :resource, polymorphic: true
      t.belongs_to :user
      t.text :body
      t.timestamps
    end
    add_index :questions, [:resource_id, :resource_type]
    add_index :questions, :user_id

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
