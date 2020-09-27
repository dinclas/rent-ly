class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.bigint :vehicle_id
      t.date :booking_start_at
      t.date :booking_end_at
      t.string :cpf

      t.timestamps
    end
  end
end
