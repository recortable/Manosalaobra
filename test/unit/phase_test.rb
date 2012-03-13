require 'test_helper'

describe Phase do
  it 'should order by position' do
    last = create(:phase, position: 5)
    first = create(:phase, position: 2)

    Phase.all.first.must_equal first
    Phase.all.last.must_equal last
  end

  it 'should find by slug' do
    p = create(:phase, name: 'Some name')
    Phase.find('some-name').must_equal p
  end

  it 'should create versions' do
    Version.count.must_equal 0
    create(:phase, name: 'Some phase')
    Version.count.must_equal 1
  end


  # PROBLEMS
  it 'can have problems' do
    phase = create(:phase)
    problem = create(:problem, phase_id: phase.id)
    phase.problems.count.must_equal 1
    phase.problems.first.must_equal problem
  end
end
