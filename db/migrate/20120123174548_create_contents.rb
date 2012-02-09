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

    Page.create(title: '¿Qué? / ¿Quienes? / ¿Cómo?', content_type: 'markdown')
    Page.create(title: '¿Por qué la participación?', content_type: 'markdown')
  end
end
