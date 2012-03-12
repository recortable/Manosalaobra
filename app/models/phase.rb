class Phase < ActiveRecord::Base
  # RELATIONS
  has_many :problems

  # SCOPES
  default_scope order: 'position ASC'

  # VALIDATIONS
  validates :name, presence: true
  validates :token, presence: true, uniqueness: true
  validates :position, presence: true

  # EXTENSIONS
  extend FriendlyId
  friendly_id :token
end
