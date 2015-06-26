class Raspberry < ActiveRecord::Base
  belongs_to :day
  validates_presence_of :kg, :rate
end
