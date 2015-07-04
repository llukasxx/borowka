class Day < ActiveRecord::Base
  belongs_to :user
  has_one :blueberry, dependent: :destroy
  has_one :raspberry, dependent: :destroy
  has_one :blackberry, dependent: :destroy
  has_one :hour, dependent: :destroy
  accepts_nested_attributes_for :blueberry, :raspberry, :blackberry, :hour

  validates_uniqueness_of :date, scope: :user

  def Day.total_sum(user)
    days = user.days
    sum = 0
    days.each do |d|
      sum += d.blueberry.sum + d.raspberry.sum + d.blackberry.sum + d.hour.sum + d.food
    end
    sum
  end

end