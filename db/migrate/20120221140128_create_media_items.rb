class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :title, limit: 120
      t.string :content_type, limit: 64
      t.text :embed_code
      t.string :file, limit: 300
      t.string :url, limit: 200
      t.integer :width
      t.integer :height
      t.string :settings, limit: 300
      t.timestamps
    end
  end
end
