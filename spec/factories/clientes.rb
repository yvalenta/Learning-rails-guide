# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cliente do
    nombre { Faker::Name.name }
    association :ciudad
    association :departamento
  end
end
