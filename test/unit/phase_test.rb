require 'test_helper'

describe Phase do
  it 'should order by position' do
    last = create(:phase, position: 5)
    first = create(:phase, position: 2)

    Phase.all.first.must_equal first
    Phase.all.last.must_equal last
  end

  it 'should have unique tokens' do
    create(:phase, token: 'token')
    phase = build(:phase, token: 'token')
    phase.save.must_equal false
    phase.token = 'token2'
    phase.save.must_equal true
  end

  it 'should find by token' do
    p = create(:phase, token: 'some-token')
    Phase.find('some-token').must_equal p
  end


  # PROBLEMS
  it 'can have problems' do
    phase = create(:phase)
    problem = create(:problem, phase_id: phase.id)
    phase.problems.count.must_equal 1
    phase.problems.first.must_equal problem
  end
end
