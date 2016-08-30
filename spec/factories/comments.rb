FactoryGirl.define do
  factory :comment do
    user
    todo
    content 'This is a test comment.'
  end
end
