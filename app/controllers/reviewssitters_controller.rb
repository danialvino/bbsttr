class ReviewssittersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]
  load_and_authorize_resource param_method: :user_params
  def index
    @reviewssitters = Reviewssitter.where(sitter_id: current_user.sitter.id)
  end

  def new
    @reviewssitter = Reviewssitter.new
  end


  def create
    @reviewssitter = Reviewssitter.new(user_params)
    @reviewssitter.booking = @booking
    @reviewssitter.sitter_id = @booking.sitter_id
    @reviewssitter.user_id = @booking.user_id
    if @reviewssitter.save
      redirect_to bookings_path
    else
      redirect_to  bookings_path, alert: "Você ja avaliou essa prestação"
    end
  end

  private

  def user_params
    params.require(:reviewssitter).permit(:description, :rating, :content)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
