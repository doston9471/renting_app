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
        result = StatusUpdate.call(renter: @renting.renter)
        if result.success?
          StatusUpdateJob.set(wait: 1.minutes).perform_later(result.renter)
          format.html { redirect_to car_renters_path(@car_id)}
        end
      else
        format.html { render :payment }
      end
    end
  end

  def reports
    result = Reports.call(params: params)
    if result.success?
      @all_rentings = result.all_rentings
      @all_expenses = result.all_expenses
      @all_incomes = result.all_incomes
      @all_totals = result.all_totals
      filename = "Все-отчёты-#{Time.now}.xlsx"
      respond_to do |format|
        format.html
        format.xlsx {
          response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
        }
      end
    end
  end

  def renter_reports
    renter_id = params[:renter_id]
    @renter = Renter.find(renter_id)
    result = RenterReports.call(params: params, renter_id: renter_id)
    if result.success?
      @all_rentings = result.renter_rentings
      @all_expenses = result.all_expenses
      @all_incomes = result.all_incomes
      @all_totals = result.all_totals
      filename = "#{@renter.first_name}-#{@renter.last_name}-#{@renter.middle_name}-#{Time.now}.xlsx"
      respond_to do |format|
        format.html
        format.xlsx {
          response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
        }
      end
    end
  end

  def car_reports
    car_id = params[:car_id]
    @car = Car.find(car_id)
    result = CarReports.call(params: params, car_id: car_id)
    if result.success?
      @all_rentings = result.car_rentings
      @all_expenses = result.all_expenses
      @all_incomes = result.all_incomes
      @all_totals = result.all_totals
      filename = "#{@car.make}-#{@car.model}-#{@car.plate}-#{Time.now}.xlsx"
      respond_to do |format|
        format.html
        format.xlsx {
          response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
        }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def renting_params
      params.require(:renting).permit(:expense, :income, :total, :payment_date, :car_id, :renter_id)
    end
end
