FactoryGirl.define do

  factory :bill do
    amount      { rrand(2333.43) }
    description { Faker::Lorem.sentence }
    date        { Date.today }
    # fill in date here using faker! with blocks {}
  end
end
