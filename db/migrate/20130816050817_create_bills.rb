class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string     :description
      t.integer    :amount
      t.references :list
      t.date       :date
      t.boolean    :paid
      t.date       :date_paid

      t.timestamps
    end
  end
end
