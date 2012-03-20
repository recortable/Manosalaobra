# Phase
#
# Una fase del proceso de vivienda. Seguramente sólo existirán
# tres: diseño, construcción, uso (y re-uso)
#
class Phase < ActiveRecord::Base
  # EXTENSIONS
  include Translatable
  translates :name, :description
  extend FriendlyId
  friendly_id :name, use: :simple_i18n
  has_paper_trail
  acts_as_list

  # RELATIONS
  has_many :problems

  # SCOPES
  default_scope order: 'position ASC'

  # VALIDATIONS
  validates :name_es, presence: true, uniqueness: true
  validates :name_ca, uniqueness: true
end
