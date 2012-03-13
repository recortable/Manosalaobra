require 'test_helper'

describe 'Phases integration' do
  it "index phases" do
    visit enter_path(Factory(:user)) # Login as admin
    Factory(:phase, name: 'Uno')
    Factory(:phase, name: 'Dos')
    visit phases_path
    page.text.must_include 'Uno'
    page.text.must_include 'Dos'
  end

  it "show phase if admin" do
    phase = Factory(:phase)
    login_user(Factory(:user))
    visit phase_path(phase)
    page.text.must_include phase.name
  end

  it "not show phase if admin" do
    phase = Factory :phase
    Factory(:user)
    login_user(Factory(:user))
    visit phase_path(phase)
    page.text.wont_include phase.name
  end

  it "new phase" do
    login_user(Factory(:user))
    visit new_phase_path
    fill_in 'phase_name', with: 'Fase Uno'
    fill_in 'phase_position', with: '1'
    click_submit
    Phase.count.must_equal 1
    phase = Phase.first
    phase.name.must_equal 'Fase Uno'
  end

  it "edit phase" do
    phase = create(:phase)
    login_user(Factory(:user))
    visit edit_phase_path(phase)
    fill_in 'phase_name', with: 'Edited phase'
    click_submit
    phase = Phase.find phase.id
    phase.name.must_equal 'Edited phase'
  end
end
