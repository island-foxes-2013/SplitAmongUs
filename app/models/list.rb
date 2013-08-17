class List < ActiveRecord::Base
  has_many :bills
  has_many :groups
  has_many :users, through: :groups

  validates :name, presence: true

  # Need to create a method to calculate total amount
end
