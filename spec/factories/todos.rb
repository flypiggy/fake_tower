FactoryGirl.define do
  factory :todo do
    sequence(:name) { |n| "Task#{n}" }
    describe 'Test tasks'
    project
    user
    due_date { 1.days.since }
  end
end
