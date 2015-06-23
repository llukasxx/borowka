class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.float :amount
      t.float :rate
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
