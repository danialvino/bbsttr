class ReviewsparentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @reviewsparents = Reviewsparent.where(user: current_user)
  end

  # def show
  #   @reviewsparent = Reviewsparent.find(params[:id])
  # end

  def new
    @reviewsparent = Reviewsparent.new
  end

  def create
    @reviewsparent = Reviewsparent.new(user_params)
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
  #   @reviewsparent = Reviewsparent.find(params[:id])
  # end

  # def update
  #   @reviewparent = Reviewparent.find(params[:id])
  #   @reviewparent.update(user_params)
  # end

  # def destroy
  # end

  private

  def user_params
    params.require(:reviewparent).permit(:booking_id)
  end
end
