require 'test_helper'

describe 'Phases integration' do
  it "index phases if admin" do
    visit enter_path(create(:user, role: :admin)) 
    create(:phase, name: 'Uno')
    create(:phase, name: 'Dos')
    visit phases_path
    page.text.must_include 'Uno'
    page.text.must_include 'Dos'
  end

  it "show phase if admin" do
    login_user(create(:user, role: :admin))
    phase = create(:phase)
    visit phase_path(phase)
    page.text.must_include phase.name
  end

  it "not show phase if not admin" do
    login_user(create(:user))
    phase = create(:phase)
    visit phase_path(phase)
    page.current_path.wont_equal phase_path(phase)
  end

  it "new as admin should create phases" do
    login_user(create(:user, role: :admin))
    visit new_phase_path
    fill_in 'phase_name', with: 'Fase Uno'
    fill_in 'phase_position', with: '1'
    click_submit
    Phase.count.must_equal 1
    phase = Phase.first
    phase.name.must_equal 'Fase Uno'
  end

  it "edit as admin should update phase" do
    login_user(create(:user, role: :admin))
    phase = create(:phase)
    visit edit_phase_path(phase)
    fill_in 'phase_name', with: 'Edited phase'
    click_submit
    phase = Phase.find phase.id
    phase.name.must_equal 'Edited phase'
  end
end
