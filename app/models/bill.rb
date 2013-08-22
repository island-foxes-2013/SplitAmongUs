class Bill < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :description, :amount, :date, :list_id, :user_id, presence: true

  monetize :amount_cents 
  
  def shared_amount
    Money.new(shared_amount_cents)
  end

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

  def as_json(options)
    {
      id: id,
      amount: amount_cents,
      description: description, 
      date: date, 
      paid_by: paid_by, 
      date_paid: date_paid,
      shared_amount: shared_amount_cents,
      errors: errors.full_messages
    }
  end
end

