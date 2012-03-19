class Example < ActiveRecord::Base
  # EXTENSIONS
  include Translatable
  extend FriendlyId
  friendly_id :title, use: :simple_i18n
  translates :title, :slug, :body

  # RELATIONS
  belongs_to :user
  has_many :solution_examples
  has_many :solutions, through: :solution_examples

  # VALIDATIONS
  validates :title, presence: true, 
    length: { minimum: 3, maximum: 200 }
  validates :user_id, presence: true 

end 
