
FactoryGirl.define do
  factory :empresa do
    nombre { Faker::Company::name }
    association :ciudad
    association :departamento

    factory :empresa_invalida do
      nombre nil
    end

  end
end
