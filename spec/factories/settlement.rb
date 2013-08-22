FactoryGirl.define do

  factory :settlement do |f|
    f.list_id "1"
    f.payer_id "25"
    f.payee_id "24"
    f.amount { rand(2333.43) }
  end

  factory :invalid_settlement, parent: :settlement do |f|
    f.payer_id nil
    f.payee_id nil
    f.amount nil
  end
end