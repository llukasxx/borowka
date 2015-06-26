class User < ActiveRecord::Base
  after_create :create_rate

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates_presence_of :firstname, :lastname

  has_many :days, dependent: :destroy
  has_one :rate, dependent: :destroy

  private
    def create_rate
      Rate.create(user_id: self.id)
    end
end
