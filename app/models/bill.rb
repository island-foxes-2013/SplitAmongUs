class Bill < ActiveRecord::Base
  belongs_to :list

  monetize :amount_cents  
  
  validates :description, :amount, :date, :list_id, presence: true
  
  # do something incase the amount doesn't save to the db correctly
end
