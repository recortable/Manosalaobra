require 'test_helper'

describe User do
  it "should have name and email" do
    u = Factory.create :user
    u.name.wont_be :empty?
    u.email.wont_be :empty?
  end
end
