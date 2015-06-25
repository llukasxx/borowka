class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.float :blueberry, default: 1.0
      t.float :raspberry, default: 1.0
      t.float :blackberry, default: 1.0
      t.float :hour, default: 5.0
      t.float :food, default: 7.0

      t.timestamps null: false
    end
  end
end
