class FixUserId < ActiveRecord::Migration
  def change
    rename_column :bills, :owner_id, :user_id
  end
end
