class MonetizeSettlementAmountColumn < ActiveRecord::Migration
  def change
    rename_column :settlements, :amount, :amount_cents
    change_column_default :settlements, :amount_cents, 0
  end
end
