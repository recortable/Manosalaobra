require 'test_helper'

describe 'Problems integration' do
  it "index problems" do
    login_user(Factory(:user))
    Factory(:problem, title: 'Uno')
    Factory(:problem, title: 'Dos')
    visit problems_path
    page.text.must_include 'Uno'
    page.text.must_include 'Dos'
  end

  it "new problem" do
    login_user(Factory(:user))
    phase = create(:phase)
    visit new_phase_problem_path(phase)
    page.text.must_include phase.name 
  end
end
