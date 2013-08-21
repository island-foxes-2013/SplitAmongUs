class Bill < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  monetize :amount_cents 
  monetize :shared_amount_cents 
  
  validates :description, :amount, :date, :list_id, :user_id, presence: true


  def shared_amount_cents
  	amount_cents / list.users.count
  end
  
  def amount_in_cents
    amount.fractional
  end

  def paid_by
    list.users.find do |user|
      user.id == user_id
    end
  end
end

