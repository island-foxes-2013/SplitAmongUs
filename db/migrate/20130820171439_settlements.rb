class Settlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.integer :payer_id
      t.integer :payee_id
      t.integer :amount
      t.integer :list_id

      t.timestamps
    end
  end
end
