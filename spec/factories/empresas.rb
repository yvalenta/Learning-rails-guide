# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :empresa do
    nombre "El colombiano"
    association :ciudad
    association :departamento
  end
end
