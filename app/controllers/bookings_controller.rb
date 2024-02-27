class BookingsController < ApplicationController
  def new
    @pony = Pony.find(params[:pony_id])
    @booking = Booking.new
  end

  def create
    @pony = Pony.find(params[:pony_id])
    @booking = Booking.new(bookings_params)
    @booking.pony = @pony
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
