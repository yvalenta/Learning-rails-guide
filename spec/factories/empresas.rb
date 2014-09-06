# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :empresa do
    nombre "MyString"
    ciudad nil
    departamento_references "MyString"
  end
end
