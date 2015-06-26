class Day < ActiveRecord::Base
  belongs_to :user
  has_one :blueberry, dependent: :destroy
  has_one :raspberry, dependent: :destroy
  has_one :blackberry, dependent: :destroy
  has_one :hour, dependent: :destroy
  accepts_nested_attributes_for :blueberry

  validates_uniqueness_of :date

end