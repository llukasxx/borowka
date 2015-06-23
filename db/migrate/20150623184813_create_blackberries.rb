class CreateBlackberries < ActiveRecord::Migration
  def change
    create_table :blackberries do |t|
      t.integer :day_id
      t.float :kg
      t.float :rate

      t.timestamps null: false
    end
  end
end
