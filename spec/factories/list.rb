FactoryGirl.define do

  factory :list do |f|
    f.name "Awesome List"
    f.total_amount 500
    # fill in date here using faker! with blocks {}
  end

  factory :invalid_list, parent: :list do |f|
    f.name nil
    f.total_amount nil
  end
end
