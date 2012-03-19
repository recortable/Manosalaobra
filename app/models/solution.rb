class Solution < ActiveRecord::Base
  # EXTENSIONS
  include Translatable
  extend FriendlyId
  friendly_id :title, use: :simple_i18n
  translates :title, :slug, :body

  # RELATIONS 
  belongs_to :problem, counter_cache: true
  belongs_to :user
  belongs_to :phase
  has_many :solution_examples
  has_many :examples, through: :solution_examples

  # VALIDATIONS
  validates :title, presence: true
  validates :problem_id, presence: true
  validates :user_id, presence: true
  validates :phase_id, presence: true

  # OPERATIONS
  def add_example(example, user)
    SolutionExample.create(example: example, solution: self, user: user)
  end
end
