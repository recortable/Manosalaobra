class SolutionExample < ActiveRecord::Base
  belongs_to :example
  belongs_to :solution
  belongs_to :user

  validates_presence_of :example_id, :solution_id, :user_id
end
