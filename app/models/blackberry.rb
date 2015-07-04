class Blackberry < ActiveRecord::Base
  belongs_to :day
  validates_presence_of :kg, :rate

  def sum
    kg * rate
  end
  
end
