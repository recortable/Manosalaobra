require 'test_helper'

describe User do
  it "must have name and email" do
    u = Factory.create :user
    u.name.wont_be :empty?
    u.email.wont_be :empty?
  end

  it "should be found by slugged name" do
    u = Factory.create(:user, name: 'any name', email: 'anyname@example.com')
    User.find('any-name').wont_be :nil?
  end

  it "can be admin" do
    u = Factory(:user)
    u.admin?.must_equal false
    u.update_attribute(:role, 'admin')
    u.admin?.must_equal true
  end

  # MEMBERSHIPS
  it "should destroy memberships when destroy" do
    user = Factory(:user)
    g = Factory(:group)
    g.users << user
    Membership.count.must_equal 1
    user.destroy
    Membership.count.must_equal 0
  end
end
