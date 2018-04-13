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
    if @available.valid?
      if no_repetition(@available)
        if @available.save
          redirect_to availables_path
        else
          render :index
        end
      else
        redirect_to availables_path, alert: "Você não pode ter duas disponibilidades no mesmo horário"
      end
    else
      render :index
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

  def no_repetition(newavailable)
    datescreated = Available.where(sitter_id: current_user.sitter.id)
    datescreated.each do |date|
      daterange = (date.start_time..date.end_time)
      if daterange.cover?(newavailable.start_time.to_datetime) || daterange.cover?(newavailable.end_time.to_datetime)
        return false
      else
        return true
      end
    end
  end
end
