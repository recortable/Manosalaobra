require 'test_helper'

describe Example do
  # SOLUTIONS
  it "can have solutions" do
    solution = create(:solution)
    example = create(:example)
    solution.add_example(example, solution.user)

    example.reload
    example.solutions.count.must_equal 1
    example.solutions.first.must_equal solution
  end
end
