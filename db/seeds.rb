List.destroy_all
Group.destroy_all
User.destroy_all

def populate_users_table

  User.create(name: 'example', email: 'example@example.com', password: 'password', password_confirmation: 'password')

  10.times do |user|
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
  end
end
populate_users_table

def populate_lists
  User.all.each do |user|
    3.times do |i|
      list = user.lists.create(name: Faker::Name.name)
      # binding.pry
      list.users << User.all.sample
      list.users << User.all.sample
      list.users << User.all.sample
      list.users << User.all.sample
      list.save
    end
  end
end
populate_lists


def populate_bills
  List.all.each do |list|
    3.times do |i|
      date = Date.today - i.days
      bill = Bill.new(description: Faker::Lorem.sentence, amount: 233.23, date: date)
      bill.list_id = List.all.sample
      bill.user_id = User.all.sample
      bill.save
    end
  end
end
populate_bills
