class Hour < ActiveRecord::Base
  belongs_to :day
  validates_presence_of :amount, :rate
end
