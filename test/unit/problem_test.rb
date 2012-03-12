require 'test_helper'

describe Problem do
  it 'should have phase and user' do
    p = Factory :problem
    p.user.wont_be :nil?
    p.phase.wont_be :nil?
  end
end
