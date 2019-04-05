class Renting < ApplicationRecord
  belongs_to :car
  belongs_to :renter
end
