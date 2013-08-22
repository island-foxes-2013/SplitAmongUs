FactoryGirl.define do

  factory :user, aliases: [:payer, :payee] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation { password }
  end
end
