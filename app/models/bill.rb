class Bill < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  monetize :amount_cents  
  
  validates :description, :amount, :date, :list_id, :user_id, presence: true

  def amount_in_cents
    amount.fractional
  end
end

