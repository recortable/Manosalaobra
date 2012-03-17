require 'test_helper'

describe 'Problems integration' do
  it "index problems if admin" do
    login_user(create(:user, role: :admin))
    create(:problem, title: 'Uno')
    create(:problem, title: 'Dos')
    visit problems_path
    page.text.must_include 'Uno'
    page.text.must_include 'Dos'
  end

  it "show problems" do
    problem = create(:problem, 
                     body_context: Faker::Lorem.sentence, 
                     body_description: Faker::Lorem.sentence, 
                     body_solutions: Faker::Lorem.sentence)
    problem.solutions << create(:solution, title: 'Solution 1')
    problem.solutions << create(:solution, title: 'Solution 2')
    problem.save
    visit problem_path(problem)
    page.text.must_include problem.title
    page.text.must_include problem.body_context
    page.text.must_include problem.body_description
    page.text.must_include problem.body_solutions
    page.text.must_include 'Solution 1'
    page.text.must_include 'Solution 2'
  end

  it "show unpublished problem only if admin" do
    problem = create(:problem, published: false)
    login_user(nil)
    visitable?(problem_path(problem)).must_equal false
    login_user(create(:user))
    visitable?(problem_path(problem)).must_equal false
    login_user(create(:user, role: :admin))
    visitable?(problem_path(problem)).must_equal true
  end

  it "new problem if admin" do
    login_user(create(:user, role: :admin))
    phase = create(:phase)
    visit new_phase_problem_path(phase)
    page.text.must_include phase.name 
    page.fill_in 'problem_title', with: 'Problem title'
    click_submit
    page.text.must_include 'Problem title'
    page.text.must_include phase.name

    phase.reload
    phase.problems.count.must_equal 1
    problem = phase.problems.first
    problem.title.must_equal 'Problem title'
    page.current_path.must_equal problem_path(problem)
  end
end
