class Problem < ActiveRecord::Base
  belongs_to :user
  belongs_to :phase
  belongs_to :parent, class_name: 'Problem'
  has_many :children, class_name: 'Problem', foreign_key: :parent_id
  has_many :solutions

  store :settings, accesors: []

  # VALIDATIONS
  validates :title, presence: true
  validates :user_id, presence: true
  validates :phase_id, presence: true

  # EXTENSIONS
  extend FriendlyId
  friendly_id :title, use: [:slugged, :globalize]
  translates :title, :slug, :body_context, :body_description,
    :body_solutions, versioning: true

end
