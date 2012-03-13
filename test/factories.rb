
FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}" }
    email { "#{name}@example.com" }
    password { 'secret' }
    password_confirmation { password }
  end

  factory :phase do
    sequence(:name) {|n| "Phase #{n}" }
    sequence(:position)
  end

  factory :problem do
    user
    phase
    sequence(:title) {|n| "Problem #{n}" }
  end

  factory :solution do
    user
    phase
    problem
    sequence(:title) {|n| "Solution #{n}" }
  end

  factory :group do
    user
    sequence(:name) {|n| "Group #{n}" }
  end

  factory :example do
    sequence(:title) {|n| "Example #{n}" }
    user
  end
end
