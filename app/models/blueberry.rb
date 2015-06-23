class Blueberry < ActiveRecord::Base
  belongs_to :day
  validates_presence_of :day_id, :kg, :rate
end
