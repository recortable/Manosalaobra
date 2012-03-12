require 'test_helper'

describe Solution do
  # EXAMPLES
  it "can have examples" do
    solution = create :solution
    solution.add_example(create(:example), solution.user)
    
    solution.examples.count == 1
  end
end
