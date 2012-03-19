class Problem < ActiveRecord::Base
  # EXTENSIONS
  include Translatable
  extend FriendlyId
  friendly_id :title, use: :simple_i18n
  translates :title, :slug, :body_context, :body_description,
    :body_solutions
  store :settings, accesors: []

  # RELATIONS
  belongs_to :user
  belongs_to :phase
  belongs_to :parent, class_name: 'Problem'
  has_many :children, class_name: 'Problem', foreign_key: :parent_id
  has_many :solutions

  # VALIDATIONS
  validates :title, presence: true
  validates :user_id, presence: true
  validates :phase_id, presence: true

end
