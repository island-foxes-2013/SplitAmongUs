class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string     :description
      t.decimal    :amount,     :precision => 8, :scale => 2, :default => 0.0
      t.references :list
      t.date       :date
      t.boolean    :paid
      t.date       :date_paid

      t.timestamps
    end
  end
end
