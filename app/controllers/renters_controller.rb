class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update, :destroy]

  # GET /renters
  # GET /renters.json
  def index
    @car = Car.find(params[:car_id])
    @renters = Renter.where(car_id: @car.id)
  end

  # GET /renters/1
  # GET /renters/1.json
  def show
    @car = Car.find(params[:car_id])
  end

  # GET /renters/new
  def new
    @car = Car.find(params[:car_id])
    @renter = Renter.new
  end

  # GET /renters/1/edit
  def edit
    @car = Car.find(params[:car_id])
  end

  # POST /renters
  # POST /renters.json
  def create
    @renter = Renter.new(renter_params)
    @car = Car.find(params[:car_id])
    respond_to do |format|
      if @renter.save
        format.html { redirect_to car_renter_path(@car, @renter), notice: 'Renter was successfully created.' }
        format.json { render :show, status: :created, location: @renter }
      else
        format.html { render :new }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /renters/1
  # PATCH/PUT /renters/1.json
  def update
    @car = Car.find(params[:car_id])
    respond_to do |format|
      if @renter.update(renter_params)
        format.html { redirect_to car_renter_path(@car, @renter), notice: 'Renter was successfully updated.' }
        format.json { render :show, status: :ok, location: @renter }
      else
        format.html { render :edit }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renters/1
  # DELETE /renters/1.json
  def destroy
    @car = Car.find(params[:car_id])
    @renter.destroy
    respond_to do |format|
      format.html { redirect_to car_renters_path(@car), notice: 'Renter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_renter
      @renter = Renter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def renter_params
      params.require(:renter).permit(:first_name, :last_name, :phone, :email, :car_id)
    end
end
