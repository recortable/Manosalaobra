class SolutionExample < ActiveRecord::Base
  belongs_to :example, counter_cache: :solutions_count
  belongs_to :solution, counter_cache: :examples_count
  belongs_to :user

  validates_presence_of :example_id, :solution_id, :user_id
end
