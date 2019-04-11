class StatusUpdate
  include Interactor

  def call
    @renter = context.renter
    context.renter = update_status(@renter)
  end

  def update_status(renter)
    if renter.update!(status: :paid)
      renter
    else
      context.fail!(error: 'failed')
    end
  end
end