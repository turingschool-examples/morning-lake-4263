FactoryBot.define do
  factory :challenge do
    project_budget {rand(1000..5000)}
    theme {Faker::Book.title}
  end
end
