class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  after_create :create_rate

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates_presence_of :firstname, :lastname

  has_many :days, dependent: :destroy
  has_one :rate, dependent: :destroy

  def all_earnings
    number_to_currency(Day.total_sum(self), :unit=>'€')
  end

  private
    def create_rate
      Rate.create(user_id: self.id)
    end
end
