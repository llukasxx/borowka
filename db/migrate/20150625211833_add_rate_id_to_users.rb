class AddRateIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rate_id, :integer
  end
end
