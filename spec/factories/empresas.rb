
FactoryGirl.define do
  factory :empresa do
    nombre { Faker::Company::name }
    association :ciudad
    association :departamento

  end
end
