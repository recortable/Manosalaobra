require 'test_helper'

describe Problem do
  it 'should have phase and user' do
    p = create :problem
    p.user.wont_be :nil?
    p.phase.wont_be :nil?
  end

  it 'can have one parent' do
    parent = create :problem
    child = create :problem, parent_id: parent.id
    child.parent.must_equal parent
  end

  
  it 'can have children' do
    parent = create :problem
    create(:problem, parent_id: parent.id)
    create(:problem, parent_id: parent.id)
    parent.children.count.must_equal 2
  end

  # SOLUTIONS
  it 'can have solutions' do
    p = create :problem
    solution = create(:solution, problem_id: p.id)
    p.solutions.include?(solution).must_equal true
  end

  it 'should count solutions' do
    p = create :problem
    s = create :solution, problem_id: p.id
    p.reload
    p.solutions_count.must_equal 1
  end
end
