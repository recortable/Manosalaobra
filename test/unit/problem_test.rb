require 'test_helper'

describe Problem do
  it 'should have phase and user' do
    p = Factory :problem
    p.user.wont_be :nil?
    p.phase.wont_be :nil?
  end

  it 'can have one parent' do
    parent = Factory :problem
    child = Factory :problem, parent_id: parent.id
    child.parent.must_equal parent
  end

  
  it 'can have children' do
    parent = Factory :problem
    Factory(:problem, parent_id: parent.id)
    Factory(:problem, parent_id: parent.id)
    parent.children.count.must_equal 2
  end

  it 'can have solutions' do
    p = Factory :problem
    solution = Factory(:solution, problem_id: p.id)
    p.solutions.include?(solution).must_equal true
  end
end
