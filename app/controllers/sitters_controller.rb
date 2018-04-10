class SittersController < ApplicationController

  def index
    @sitters = Sitter.all
  end

  def show
    @sitter = Sitter.find(params[:id])
  end

  def new
    @sitter = Sitter.new
  end

  def create
    @sitter = Sitter.new(user_params)
    @user = current_user
    @sitter.user = @user
    if @sitter.save
      redirect_to root_path, notice: "Parabéns! agora você é uma Babá!"
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:sitter).permit(:pay_rate, :about, :skills, :user_id)
  end

end
