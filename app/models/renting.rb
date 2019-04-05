class Renting < ApplicationRecord
  belongs_to :car
  belongs_to :renter
  before_save :give_total

  def give_total
    self.total = self.income - self.expense
  end

end
