class Bill < ActiveRecord::Base
  belongs_to :list
  
  monetize :amount_cents  
end
