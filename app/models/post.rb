class Post < ActiveRecord::Base
  
  has_many :comments, dependent: :delete_all
  
  validates :title, presence: true
end
