FactoryGirl.define do
  factory :departamento do
    nombre { Faker::Address.city }
    cod_dane { Faker::Address.zip_code}
  end
end
