class RemoveTotalAmountCentsInLists < ActiveRecord::Migration
  def change
    remove_column :lists, :total_amount_cents
  end
end
