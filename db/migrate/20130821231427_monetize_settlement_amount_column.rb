class MonetizeSettlementAmountColumn < ActiveRecord::Migration
  def change
    change_column :settlements, :amount_cents, :integer, :default => 0
  end
end
