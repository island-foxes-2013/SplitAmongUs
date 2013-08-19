FactoryGirl.define do

  factory :group, :parent => :user do |user|
  	user.lists { |list| [ list.association(:list),
					  	  list.association(:list) ] }

  	# lists { [FactoryGirl.create(:list)] }
    # fill in date here using faker! with blocks {}
  end
end
