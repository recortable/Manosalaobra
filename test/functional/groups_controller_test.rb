require 'test_helper'

describe 'Groups integration' do
  it "index groups" do
    login_user(nil)
    Factory(:group, name: 'Uno')
    Factory(:group, name: 'Dos')
    visit groups_path 
    page.text.must_include 'Uno'
    page.text.must_include 'Dos'
  end

  it "show group" do
    login_user(nil)
    g = Factory(:group)
    visit group_path(g)
    page.text.must_include g.name
  end

  it "new group" do
    Factory(:user)
    login_user(Factory(:user))
    visit new_group_path
    fill_in 'group_name', with: 'My group'
    page.find('input[name="commit"]').click
    Group.count.must_equal 1
    Group.first.name.must_equal 'My group'
  end

  it "edit group" do
    group = Factory :group
    login_user(group.user)
    visit edit_group_path(group)
    fill_in 'group_name', with: 'Edited group'
    click_submit
    group.reload
    group.name.must_equal 'Edited group'
  end
end
