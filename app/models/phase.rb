class Phase < ActiveRecord::Base
  # RELATIONS
  has_many :problems

  # SCOPES
  default_scope order: 'position ASC'

  # VALIDATIONS
  validates :name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :slug, presence: true

  # EXTENSIONS
#  has_paper_trail
  extend FriendlyId
  friendly_id :name, use: [:slugged, :globalize]
  translates :name, :slug, :description#, versioning: true
end
