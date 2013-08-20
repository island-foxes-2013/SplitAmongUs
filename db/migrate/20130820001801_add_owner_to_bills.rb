class AddOwnerToBills < ActiveRecord::Migration
  def change
    add_column :bills, :owner_id, :integer
  end
end
