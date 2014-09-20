FactoryGirl.define do
  factory :usuario do
    nombre { Faker::Company::name }
    password { Faker::Internet::password(8) }
    email { Faker::Internet::email }
    apodo { Faker::Internet.user_name }
  end
end
