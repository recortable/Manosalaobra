require 'test_helper'

describe Group do
  it "shoud have name and user" do
    g = Factory :group
    g.user.must_be :present?
    g.name.must_be :present?
  end

  it "can have some users" do
    g = Factory(:group)
    g.users << Factory(:user)
    g.users.count.must_equal 1
  end
end
