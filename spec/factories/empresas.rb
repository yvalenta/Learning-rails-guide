# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :empresa do
    nombre { Faker::Company::name }
    association :ciudad
    association :departamento

  end
end
