FactoryGirl.define do

  factory :bill do
    amount      { rand(2333.43) }
    description { Faker::Lorem.sentence }
    date        { Date.today }
  end

  factory :invalid_bill, parent: :bill do |f|
    f.amount      nil
    f.description nil
    f.date        nil
  end
end
