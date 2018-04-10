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

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(user_params)
    @booking.save
  end

  private

  def user_params
    params(:booking).permit(:start_time, :end_time, :user_id, :sitter_id)
  end
end
