class Rate < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :blueberry, :raspberry, :blackberry, :hour, :food
end
