class RentingsController < ApplicationController
  
  def payment
    @car = Car.find(params[:car_id])
    @renter = Renter.find(params[:renter_id])
    @renting = Renting.new
  end

  def pay
    @renter_id = params[:renter_id]
    @car_id = params[:car_id]
    @renting = Renting.new(renting_params)
    respond_to do |format|
      if @renting.save!
        format.html { redirect_to car_renters_path(@car_id)}
      else
        format.html { render :payment }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def renting_params
      params.require(:renting).permit(:expense, :income, :total, :payment_date, :car_id, :renter_id)
    end
end
