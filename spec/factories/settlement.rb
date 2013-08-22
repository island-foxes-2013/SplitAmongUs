FactoryGirl.define do

  factory :settlement do |f|
    f.list
    f.payer
    f.payee
    f.amount { rand(2333.43) }
  end

  factory :invalid_settlement, parent: :settlement do |f|
    f.payer_id nil
    f.payee_id nil
    f.amount nil
  end
end