class MonetizeColumns < ActiveRecord::Migration
  def change
    rename_column :bills, :amount, :amount_cents
    change_column_default :bills, :amount_cents, 0
    rename_column :lists, :total_amount, :total_amount_cents
    change_column_default :lists, :total_amount_cents, 0
  end
end
