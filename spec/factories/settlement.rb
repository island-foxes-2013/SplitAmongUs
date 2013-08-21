FactoryGirl.define do

  factory :settlement do |f|
    f.list_id "1"
    f.payer_id "25"
    f.payee_id "24"
    f.amount { rand(2333.43) }
  end
end