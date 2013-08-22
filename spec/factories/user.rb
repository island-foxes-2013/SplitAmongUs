FactoryGirl.define do

  factory :user, aliases: [:payer, :payee] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation { password }

    trait :with_list do
      after(:create) do |user, _| 
        user.lists << create(:list)
      end
    end
  end
end
