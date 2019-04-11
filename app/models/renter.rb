class Renter < ApplicationRecord
  belongs_to :car
  has_many :rentings

  enum status: [
    :unpaid,
    :paid
  ]
end
