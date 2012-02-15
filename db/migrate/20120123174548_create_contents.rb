# encoding: utf-8
class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |table|
      table.string :title, limit: 300
      table.string :slug, limit: 300
      table.string :type, limit: 20
      table.text :body
      table.string :content_type, limit: 16
      table.timestamps
    end

  end
end
