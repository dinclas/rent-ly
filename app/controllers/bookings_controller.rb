class BookingsController < ApplicationController

  def index
    redirect_to action: :new
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(permited_params)
    return render 'success' if @booking.save
    render action: :new
  end

  private

  def permited_params
    params.require(:booking).permit(:vehicle_id, :booking_start_at, :booking_end_at, :cpf)
  end
end
