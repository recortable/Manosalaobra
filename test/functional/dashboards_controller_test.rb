require 'test_helper'

describe 'Dashboards integration' do

  it "have problems dashboard" do
    p1 = create(:phase, name: 'Fase1')
    p2 = create(:phase, name: 'Fase2')
    visit problems_dashboard_path
    page.text.must_include 'Fase1'
    page.text.must_include 'Fase2'
  end
end
