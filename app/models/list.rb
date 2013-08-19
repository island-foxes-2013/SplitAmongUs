class List < ActiveRecord::Base
  has_many :bills, dependent: :destroy
  has_many :groups
  has_many :users, through: :groups

  validates :name, presence: true

  monetize :total_amount_cents
  # Need to create a method to calculate total amount
end
