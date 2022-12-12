FactoryBot.define do
  factory :contestant do
    years_of_experience {rand(1..5)}
    hometown {Faker::Name.last_name}
    age {rand(1..5)}
    name {Faker::Name.name}
  end
end
