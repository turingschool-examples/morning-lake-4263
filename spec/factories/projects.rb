FactoryBot.define do
  factory :project do
    material {Faker::Book.title}
    name {Faker::Name.name}
  end
end
