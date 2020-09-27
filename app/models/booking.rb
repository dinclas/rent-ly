# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :vehicle
  validates_presence_of :vehicle, :booking_start_at, :booking_end_at, :cpf
  validate :booking_conflict

  scope :bookings_in_range, lambda { |from, to|
    where(booking_start_at: from..to).or(Booking.where(booking_end_at: from..to))
  }

  private

  def booking_conflict
    errors.add(:base, :booking_conflict) if Booking.bookings_in_range(booking_start_at, booking_end_at)
                                             .where(vehicle_id: vehicle_id)
                                             .exists?
  end
end
