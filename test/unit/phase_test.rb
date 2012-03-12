require 'test_helper'

describe Phase do
  it 'should order by position' do
    last = Factory(:phase, position: 5)
    first = Factory(:phase, position: 2)

    Phase.all.first.must_equal first
    Phase.all.last.must_equal last
  end

  it 'should have unique tokens' do
    Factory(:phase, token: 'token')
    phase = Factory.build(:phase, token: 'token')
    phase.save.must_equal false
    phase.token = 'token2'
    phase.save.must_equal true
  end
end
