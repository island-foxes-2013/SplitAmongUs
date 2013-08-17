class CreateLists < ActiveRecord::Migration
  def change
    create_table   :lists do |t|
      t.string     :name
      t.decimal  :total_amount,     :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
  end
end
