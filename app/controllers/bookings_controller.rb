class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  # Listing the bookings of a given user
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def change_status_to_canceled
    @booking.update!(status: "canceled")
    # to do : update availables
  end

end
