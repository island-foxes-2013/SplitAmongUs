class Settlement < ActiveRecord::Base
  belongs_to :payer, class_name: "User"
  belongs_to :payee, class_name: "User"
  belongs_to :list

  monetize :amount_cents

  validates :payer_id, :amount, :payee_id, :list_id, presence: true


  def amount_in_cents
    amount.fractional
  end
end