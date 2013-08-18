FactoryGirl.define do

  factory :list do |f|
    f.name "Awesome List"
    f.total_amount 50
  end

  factory :invalid_list, parent: :list do |f|
    f.name nil
    f.total_amount nil
  end
end
