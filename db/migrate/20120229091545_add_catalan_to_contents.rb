class AddCatalanToContents < ActiveRecord::Migration
  def change
    add_column :contents, :title_ca, :string, limit: 300
    add_column :contents, :body_ca, :text
  end
end
