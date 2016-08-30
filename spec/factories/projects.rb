FactoryGirl.define do
  factory :project do
    name 'MyTeam'
    describe 'This is my test team.'
    team

    transient do
      todos_count 0
    end

    after(:create) do |project, evaluator|
      create_list(:todo, evaluator.todos_count, project: project)
    end
  end
end
