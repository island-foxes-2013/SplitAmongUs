class List < ActiveRecord::Base
  has_many :bills, dependent: :destroy
  has_many :groups
  has_many :users, through: :groups

  validates :name, presence: true

  # failing message: divided by 0
  # /Users/zmontesd/Projects/DevBootCamp/SplitAmongUs/app/models/list.rb:20:in `/'
  monetize :total_amount_cents
  monetize :person_share_cents

  def total_amount_cents
    total_cents = 0
    bills.each do |bill|
      total_cents += bill.amount_cents
    end
    total_cents
  end

  def person_share_cents
    total_amount_cents == 0 ? 0 : total_amount_cents / self.users.count
  end

  def total_due_for_all_lists
    @total = Money.new(0, "USD") 
      current_user.lists.each do |list| 
        list.bills.each do |bill|  
          @total += bill.amount 
        end 
      end 
    @total   
  end
end

# TODO-JW: 
#   - write tests to verify this logic

