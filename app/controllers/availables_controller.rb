class AvailablesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @availables = Available.where(sitter_id: current_user.sitter.id)
    @available = Available.new
  end

  def show
    @available = Available.find(params[:id])
  end

  def new
    @available = Available.new
  end

  def create
    @available = Available.new(user_params)
    @sitter = current_user.sitter
      @available.sitter = @sitter
      if @available.save
        redirect_to availables_path
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
    params.require(:available).permit(:start_time, :end_time, :sitter_id)
  end
end
