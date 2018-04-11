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
    @booking = Booking.new(start_time: cookies["start_time"], end_time: cookies["end_time"])
    @sitter = Sitter.find(params[:sitter_id])
    @available = Available.find(params[:available])
    @booking.sitter = @sitter
    @booking.user = current_user
    change_available(@available)
    if @booking.save!
      redirect_to root_path
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
#btn de contratar: <%= link_to "Contratar", bookings_path(available: @result_availables.select{|av| av.sitter_id == sitter.id }[0].id, sitter_id: sitter.id), method: :post%>
# search form
# <%= form_tag sitters_path, method: :get do %>
#         <%= text_field_tag :start_time,
#           params[:start_time],
#           class: "daterange",
#           style: "color: black;"
#         %>
#         <%= text_field_tag :end_time,
#           params[:end_time],
#           class: "daterange",
#           style: "color: black;"
#         %>
#         <%= submit_tag %>
#       <% end %>
