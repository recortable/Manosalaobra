class Rate < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :rating, presence: true
end
