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

  private
    def create_rate
      Rate.create(user_id: self.id)
    end
end
