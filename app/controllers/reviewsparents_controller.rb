class ReviewsparentsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]


  def index
    @reviewsparents = Reviewsparent.where(user: current_user)
  end

  def new
    @reviewsparent = Reviewsparent.new
  end

  def create
    @reviewsparent = Reviewsparent.new(user_params)
    @reviewsparent.booking = @booking
    @reviewsparent.sitter_id = @booking.sitter_id
    @reviewsparent.user_id = @booking.user_id
    if @reviewsparent.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:reviewsparent).permit(:description, :rating, :content)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

end
