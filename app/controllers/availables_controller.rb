class AvailablesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @availables = Available.all
  end

  def show
    @available = Available.find(params[:id])
  end

  def new
    @available = Available.new
  end

  def create
    @available = Available.new(user_params)
    @sitter = Sitter.find(current_user.id)
      @available.sitter = @sitter
      if @available.save
        redirect_to root
      else
        render :new
      end
  end

  def edit
    @available = Available.find(params[:id])
  end

  def update
    @available = Available.find(params[:id])
    @available.update(user_params)
  end

  def destroy
  end

  private

  def user_params
    params.require(:available).permit(:start_time, :end_time)
  end
end
