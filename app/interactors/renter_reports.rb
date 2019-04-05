class RenterReports
  include Interactor

  def call
    context.renter_rentings, context.all_expenses, context.all_incomes, context.all_totals  = get_renter_statistics
  end

  def get_renter_statistics
    if from_date.present? and to_date.present?
      [
        get_rentings.where(created_at: DateTime.parse(from_date)..DateTime.parse(to_date)),
        get_rentings.where(created_at: DateTime.parse(from_date)..DateTime.parse(to_date)).sum(:expense),
        get_rentings.where(created_at: DateTime.parse(from_date)..DateTime.parse(to_date)).sum(:income),
        get_rentings.where(created_at: DateTime.parse(from_date)..DateTime.parse(to_date)).sum(:total)
      ]
    else
      [
        get_rentings,
        get_rentings.sum(:expense),
        get_rentings.sum(:income),
        get_rentings.sum(:total)
      ]
    end
  end

  def get_rentings
    Renting.where(renter_id: renter_id)
  end

  def from_date
    params[:from_date]
  end

  def to_date
    params[:to_date]
  end

  def renter_id
    context.renter_id
  end

  def params
    context.params
  end
end