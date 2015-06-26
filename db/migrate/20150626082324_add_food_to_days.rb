class AddFoodToDays < ActiveRecord::Migration
  def change
    add_column :days, :food, :float
  end
end
