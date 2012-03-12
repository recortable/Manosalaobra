require 'test_helper'

describe User do
  it "should have name and email" do
    u = Factory.create :user
    u.name.wont_be :empty?
    u.email.wont_be :empty?
  end

  it "should be found by slugged name" do
    u = Factory.create(:user, name: 'any name', email: 'anyname@example.com')
    User.find('any-name').wont_be :nil?
  end

  it "should be admin if id is 1" do
    Factory(:user).admin?.must_equal true
  end

  it "can be admin" do
    Factory(:user) # We create a id=1 first
    u = Factory(:user)
    u.admin?.must_equal false
    u.update_attribute(:role, 'admin')
    u.admin?.must_equal true
  end
end
