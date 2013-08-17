def populate_users_table
  10.times do |user|
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
  end
end
populate_users_table

def populate_lists
  user = User.all
  user.each do |user|
    3.times do |lists|
      user.lists.create(name: Faker::Name.name)
    end
  end
end
populate_lists


def populate_bills
  list_ids = []
  List.all.each do |list|
    list_ids << list.id
  end
  lists = List.all
  lists.each do |list|
    3.times do
      bill = Bill.new(description: Faker::Lorem.sentence, amount: 233.23)
      bill.list_id = list_ids.sample
      bill.save
    end
  end
end
populate_bills
