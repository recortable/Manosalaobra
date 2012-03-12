class Example < ActiveRecord::Base
  # RELATIONS
  belongs_to :user
  has_many :solution_examples
  has_many :solutions, through: :solution_examples

  # EXTENSIONS
  extend FriendlyId
  friendly_id :title, use: :slugged

  # VALIDATIONS
  validates :title, presence: true, 
    length: { minimum: 3, maximum: 200 }
  validates :user_id, presence: true 

end 
