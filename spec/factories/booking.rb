# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    association :vehicle
    booking_start_at { Faker::Date.backward }
    booking_end_at { Faker::Date.forward }
    cpf { '11122233344' }
  end
end
