FactoryGirl.define do
  factory :access do
    user
    team
    role 'member'
  end
end
