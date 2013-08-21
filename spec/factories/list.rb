FactoryGirl.define do

  factory :list do |f|
    f.name "Awesome List"
  end

  factory :invalid_list, parent: :list do |f|
    f.name nil
  end
end
