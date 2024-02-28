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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    redirect_to dashboard_path, notice: 'Booking was accepted.'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "Declined")
    redirect_to dashboard_path, notice: 'Booking was declined.'
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
