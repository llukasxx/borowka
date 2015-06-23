class Hour < ActiveRecord::Base
  belongs_to :day
  validates_presence_of :day_id, :amount, :rate
end
