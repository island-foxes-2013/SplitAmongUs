class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string     :name
      t.references :user
      t.references :list

      t.timestamps
    end
  end
end
