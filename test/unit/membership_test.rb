require 'test_helper'

describe Membership do
  it "can't repeat on same user and group" do
    g = Factory(:group)
    u = Factory(:user)
    m = Membership.new(user_id: u.id, group_id: g.id)
    m.save.must_equal true
    m = Membership.new(user_id: u.id, group_id: g.id)
    m.save.must_equal false
  end
end
