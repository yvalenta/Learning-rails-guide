# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :empresa do
    nombre "El colombiano"
    ciudad_id 1
    departamento_id 2
  end
end
