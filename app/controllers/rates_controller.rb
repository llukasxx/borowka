class RatesController < ApplicationController

  # GET /rates
  # GET /rates.json
  expose(:rate)
  def show
  end

  # GET /rates/1
  # GET /rates/1.json

  # GET /rates/1/edit

  # POST /rates
  # POST /rates.json

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json


  # DELETE /rates/1
  # DELETE /rates/1.json

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:user_id, :blueberry, :raspberry, :blackberry, :hour, :food)
    end
end
