class HomeController < ApplicationController
  before_action :redirect_to_days
  
  def index
  end

  private
    def redirect_to_days
      redirect_to days_path if user_signed_in?
    end
end
