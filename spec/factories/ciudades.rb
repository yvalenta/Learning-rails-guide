FactoryGirl.define do
  factory :ciudad do
    nombre "Medellin"
    cod_dane '1234'
    association :departamento
  end
end
