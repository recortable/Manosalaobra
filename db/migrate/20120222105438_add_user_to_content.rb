class AddUserToContent < ActiveRecord::Migration
  def change
    add_column :contents, :user_id, :integer
    add_column :contents, :author, :string, limit: 100
    add_column :contents, :published_at, :date
  end
end
