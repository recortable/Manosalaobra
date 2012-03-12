class Solution < ActiveRecord::Base
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

  # EXTENSIONS
  extend FriendlyId
  friendly_id :title, use: :slugged

  def add_example(example, user)
    SolutionExample.create(example: example, solution: self, user: user)
  end
end
