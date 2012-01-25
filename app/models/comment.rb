class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :body, presence: true
  validates :post, presence: true
end
