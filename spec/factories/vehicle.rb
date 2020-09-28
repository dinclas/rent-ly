# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    model { Faker::Lorem.word }
    brand { Faker::Lorem.word }
    plate { Faker::Lorem.characters(number:7) }
    model_year { Faker::Date.in_date_period.year }
    manufacture_year { Faker::Date.in_date_period.year }
  end
end