class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  after_create :create_rate

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates_presence_of :firstname, :lastname

  has_many :days, dependent: :destroy
  has_one :rate, dependent: :destroy

  def all_earnings
    sum = 0
    days.each do |d|
      sum += d.blueberry.sum + d.raspberry.sum + d.blackberry.sum + d.hour.sum + d.food
    end
    number_to_currency(sum, :unit=>'€')
  end

  def blueberry_amount
    kg = 0
    days.each do |d|
      kg += d.blueberry.kg
    end
    kg
  end

  def blueberry_value
    val = 0
    days.each do |d|
      val += (d.blueberry.kg * d.blueberry.rate)
    end
    number_to_currency(val, :unit=>'€')
  end

  def raspberry_amount
    kg = 0
    days.each do |d|
      kg += d.raspberry.kg
    end
    kg
  end

  def raspberry_value
    val = 0
    days.each do |d|
      val += (d.raspberry.kg * d.raspberry.rate)
    end
    number_to_currency(val, :unit=>'€')
  end

  def blackberry_amount
    kg = 0
    days.each do |d|
      kg += d.blackberry.kg
    end
    kg
  end

  def blackberry_value
    val = 0
    days.each do |d|
      val += (d.blackberry.kg * d.blackberry.rate)
    end
    number_to_currency(val, :unit=>'€')
  end

  def hour_amount
    amount = 0
    days.each do |d|
      amount += d.hour.amount
    end
    amount
  end

  def hour_value
    val = 0
    days.each do |d|
      val += (d.hour.amount * d.hour.rate)
    end
    number_to_currency(val, :unit=>'€')
  end

  def day_value
    val = 0
    days.each do |d|
      val += d.food
    end
    number_to_currency(val, :unit=>'€')
  end

  private
    def create_rate
      Rate.create(user_id: self.id)
    end
end
