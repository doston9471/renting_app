class Renter < ApplicationRecord
  belongs_to :car
  has_many :rentings
end
