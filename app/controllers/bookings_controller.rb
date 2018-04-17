class BookingsController < ApplicationController
load_and_authorize_resource
  # Listing the bookings of a given user
  def index
    if current_user.sitter?
      @bookings = Booking.where(sitter: current_user.sitter)
      @reviewsparent = Reviewsparent.new
    else
      @bookings = Booking.where(user: current_user)
      @reviewssitter = Reviewssitter.new
    end
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
    @booking = Booking.new(start_time: cookies["start_time"], end_time: cookies["end_time"])
    @sitter = Sitter.find(params[:sitter_id])
    @available = Available.find(params[:available])
    @booking.sitter = @sitter
    @booking.user = current_user
    change_available(@available)
    if @booking.save!
      redirect_to booking_path(@booking)
    end
  end
  # botão com params
  private

  def user_params
    params(:booking).permit(:start_time, :end_time, :user_id, :sitter_id)
  end

  def change_available(available)
    if available.start_time == @booking.start_time && available.end_time == @booking.end_time
      available.destroy
    elsif available.start_time < @booking.start_time && available.end_time == @booking.end_time
      @new_available = Available.new(start_time: available.start_time, end_time: @booking.start_time)
      @new_available.sitter = available.sitter
      available.destroy
    elsif available.end_time > @booking.end_time && available.start_time == @booking.start_time
      @new_available = Available.new(start_time: @booking.end_time, end_time: available.end_time)
      @new_available.sitter = available.sitter
      @new_available.save!
      available.destroy
    else
      @new_available = Available.new(start_time: available.start_time, end_time: @booking.start_time)
      @new_available2 = Available.new(start_time: @booking.end_time, end_time: available.end_time)
      @new_available.sitter = available.sitter
      @new_available2.sitter = available.sitter
      @new_available.save!
      @new_available2.save!
      available.destroy
    end
  end
end
# btn de contratar:
