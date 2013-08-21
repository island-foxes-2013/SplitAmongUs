class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 200,
             :default => 'http://i00.i.aliimg.com/photo/v0/217768578/Cartoon_pig_book_end.jpg'

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true    

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :bills
  has_many :groups
  has_many :lists, through: :groups
  has_many :list_users, through: :lists, source: :users

  has_many :paid_settlements, class_name: "Settlement", foreign_key: "payer_id"
  has_many :received_settlements, class_name: "Settlement", foreign_key: "payee_id"

  
    # DO ALL CALCULATIONS IN CENTS:
    #   - iterate over all paid settlements (for this ist) and add to total
    #   - iterate over all received settlements (for this list) and subtract from total

  def self.amount_owed(list, user)
    total = 0
    @grand_total = 0
    list.bills.each do |bill|
      if bill.user_id == user.id
        total += bill.amount_in_cents
      end
      @grand_total = total - list.person_share_cents
      if user.paid_settlements
          user.paid_settlements.each do |settlement|
            if settlement.list_id == list.id
            @grand_total -= settlement.amount_in_cents
            end
          end
        end 
      end

    Money.new(@grand_total)
  end

  def amount_owed(list, user)
    self.class.amount_owed(list,user)
  end

  def friends
    list_users.where("groups.user_id <> #{self.id}").uniq
  end
end

