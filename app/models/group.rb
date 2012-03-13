class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  # VALIDATIONS
  validates :name, presence: true, 
    length: {minimum: 3, maximum: 100}
  validates :user_id, presence: true
  
  # EXTENSIONS
  extend FriendlyId
  friendly_id :name, use: :slugged

end

