class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /days
  # GET /days.json
  def index
    @days = current_user.days.decorate
    @day = Day.new
    @day.blueberry = Blueberry.new
    @day.raspberry = Raspberry.new
    @day.blackberry = Blackberry.new
    @day.hour = Hour.new
  end

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
    @day.blueberry
    @day.raspberry
    @day.blackberry
    @day.hour
  end

  # POST /days
  # POST /days.json
  def create
    @day = current_user.days.build(day_params)
    if @day.save
      redirect_to days_path, notice: 'Dodano dniówke! :)'
    else
      flash[:danger] = 'Coś poszło nie tak, upewnij się czy nie podajesz złych parametrów.
                        Każde pole musi posiadać wartość, zostaw wartość 0 jeżeli nic nie uzbierałeś.
                        Pamiętaj, że każda dniówka musi mieć unikalną date, 
                        tzn nie możesz posiadać dwóch dniówek z identyczną datą.
                        Do połówek używaj \'.\' (kropek) zamiast \',\' (przecinków).'
      redirect_to days_path
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to days_path, notice: "Pomyślnie zaaktualizowano dniówke: #{@day.date}" }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: "Pomyślnie usunięto dniówke: #{@day.date}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:date, :food, 
                                  blueberry_attributes:[:id, :kg, :rate], 
                                  raspberry_attributes:[:id, :kg, :rate], 
                                  blackberry_attributes:[:id, :kg, :rate], 
                                  hour_attributes:[:id, :amount, :rate])
    end
end
