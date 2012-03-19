require 'test_helper'

describe Solution do
  # EXAMPLES
  it "can have examples" do
    solution = create :solution
    solution.add_example(create(:example), solution.user)

    solution.reload
    solution.examples.count.must_equal 1
    solution.examples_count.must_equal 1
  end
end
