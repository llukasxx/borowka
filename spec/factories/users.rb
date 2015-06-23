FactoryGirl.define do
  factory :user do
    firstname "John"
    lastname "Doe"
    email "example@email.com"
    password "password"
    password_confirmation "password"
  end

end
