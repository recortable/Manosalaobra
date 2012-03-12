
FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}" }
    email { "#{name}@example.com" }
    password { 'secret' }
    password_confirmation { password }
  end

  factory :phase do
    sequence(:name) {|n| "Phase #{n}" }
    sequence(:token) {|n| "phase#{n}" }
    sequence(:position)
  end

  factory :problem do
    user
    phase
    sequence(:title) {|n| "Problem #{n}" }
  end
end
