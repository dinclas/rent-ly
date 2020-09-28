# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'scopes' do
    describe '.in_range' do
      context 'when range is 2020-08-01 to 2020-08-30' do
        let!(:from) { Date.new(2020, 8, 1) }
        let!(:to) { Date.new(2020, 8, 30) }

        subject { described_class.in_range(from, to) }

        context 'and there no bookings' do
          it { is_expected.to be_empty }
        end

        context 'and there is a booking from 2020-07-05 to 2020-08-01' do
          let!(:booking_start_at) { Date.new(2020, 7, 5) }
          let!(:booking_end_at) { Date.new(2020, 8, 1) }
          let!(:booking) { create(:booking, booking_start_at: booking_start_at, booking_end_at: booking_end_at) }

          it { is_expected.to eq([booking]) }

          context 'and there is another booking from 2020-08-30 to 2020-09-01' do
            let!(:another_booking_start_at) { Date.new(2020, 8, 30) }
            let!(:another_booking_end_at) { Date.new(2020, 9, 1) }
            let!(:another_booking) do
              create(:booking, booking_start_at: booking_start_at, booking_end_at: booking_end_at)
            end

            it { is_expected.to eq([booking, another_booking]) }
          end
        end
      end
    end
  end

  describe '#save!' do
    context 'when there is no conflict' do
      let!(:booking) { build(:booking) }

      it 'does not raise an error' do
        expect { booking.save! }.not_to raise_error
      end
    end

    context 'when there is a conflict' do
      let!(:booking_start_at) { Date.new(2020, 8, 1) }
      let!(:booking_end_at) { Date.new(2020, 8, 10) }

      let!(:vehicle) { create(:vehicle) }

      let!(:first_booking) do
        create(:booking, vehicle: vehicle, booking_start_at: booking_start_at, booking_end_at: booking_end_at)
      end

      let!(:conflicting_booking) do
        build(:booking, vehicle: vehicle, booking_start_at: booking_start_at, booking_end_at: booking_end_at)
      end

      it 'raises an error' do
        expect { conflicting_booking.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
