class MonetizeSettlementColumn < ActiveRecord::Migration
  def change
    change_column :bills, :amount_cents, :integer, :default => 0
  end
end
