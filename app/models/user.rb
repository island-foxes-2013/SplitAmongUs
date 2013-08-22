class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 200,
             :default => 'http://i.minus.com/imbEl8iMIekdR.jpg'

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

  
  def self.amount_owed(list, user) # how much this user is owed (from others)
    total = 0
    list.bills.where(user_id: user.id).each do |bill|
      total += bill.amount_in_cents
    end

    user.paid_settlements.where(list_id: list.id).each do |settlement|
      total += settlement.amount_in_cents
    end

    user.received_settlements.where(list_id: list.id).each do |settlement|
      total -= settlement.amount_in_cents
    end

    Money.new(total - list.person_share_cents)
  end

  def amount_owed(list, user)
    self.class.amount_owed(list,user)
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

  def friends
    list_users.where("groups.user_id <> #{self.id}").uniq

  end
end

