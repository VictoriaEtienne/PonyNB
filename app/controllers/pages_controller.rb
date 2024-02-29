class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @booked_ponies = @user.bookings.includes(:pony).map(&:pony)
    @total_bookings = @user.bookings.count
    @pending_bookings = @user.bookings.pending.count
    @accepted_bookings = @user.bookings.accepted.count
    @declined_bookings = @user.bookings.declined.count
    @ponies = current_user.ponies
  end
end
