FactoryGirl.define do
  factory :ciudad do
    nombre { Faker::Address.city }
    cod_dane { Faker::Address.zip_code }
    association :departamento
  end
end
