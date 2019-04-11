class StatusUpdateJob < ApplicationJob
  queue_as :default

  def perform(renter)
    p "===== UPDATING STATUS OF RENTER #{renter.id} - #{renter.first_name} - #{renter.last_name} - #{renter.middle_name} - #{renter.phone} ====="
    # @counter = renter.rentings.where(created_at: (Time.now-24.hours)..(Time.now)).count
    @counter = renter.rentings.where(created_at: (Time.now-1.minutes)..(Time.now)).count
    if @counter == 0
      if renter.update!(status: :unpaid)
        p "===== UPDATED SUCCESSFULLY ====="      
      else
        p "===== FAILED ====="
      end
    end
  end
end
