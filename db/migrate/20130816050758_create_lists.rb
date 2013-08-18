class CreateLists < ActiveRecord::Migration
  def change
    create_table   :lists do |t|
      t.string     :name
      t.integer    :total_amount

      t.timestamps
    end
  end
end
