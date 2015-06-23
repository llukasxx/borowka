class CreateRaspberries < ActiveRecord::Migration
  def change
    create_table :raspberries do |t|
      t.float :kg
      t.float :rate
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
