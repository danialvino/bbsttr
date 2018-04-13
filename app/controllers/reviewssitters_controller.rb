class ReviewssittersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @reviewssitters = Reviewssitter.where(sitter_id: current_user.sitter.id)
  end

  # def show
  #   @reviewssitter = Reviewssitter.find(params[:id])
  # end

  def new
    @reviewssitter = Reviewssitter.new
  end

  def create
    @reviewssitter = Reviewssitter.new(user_params)
    #A ALTERAR ^^
    # @sitter = current_user.sitter
    #   @available.sitter = @sitter
    #   if @available.save
    #     redirect_to availables_path
    #   else
    #     render :new
    #   end
  end

  # def edit
  #   @reviewssitter = Reviewssitter.find(params[:id])
  # end

  # def update
  #   @reviewsitter = Reviewsitter.find(params[:id])
  #   @reviewsitter.update(user_params)
  # end

  # def destroy
  # end

  private

  def user_params
    params.require(:reviewsitter).permit(:booking_id)
  end
end
