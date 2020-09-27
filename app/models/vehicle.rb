class Vehicle < ApplicationRecord
  validates_presence_of :model, :brand, :plate, :model_year, :manufacture_year
  has_many :bookings

  def name
    "#{self.brand} - #{self.model} - #{self.model_year}"
  end
end
