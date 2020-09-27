class Vehicle < ApplicationRecord
  validates_presence_of :model, :brand, :plate, :model_year, :manufacture_year
end
