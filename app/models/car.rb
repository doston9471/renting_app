class Car < ApplicationRecord
  has_many :renters
  has_many :rentings
end
