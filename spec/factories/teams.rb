FactoryGirl.define do
  factory :team do
    name 'MyTeam'
    association :owner, factory: :user
  end
end
