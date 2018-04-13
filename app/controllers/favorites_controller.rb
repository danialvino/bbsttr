class FavoritesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @favorites = Favorite.where(user: current_user)
  end

  # def show
  #   @reviewsparent = Reviewsparent.find(params[:id])
  # end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(user_params)
    @favorite.user = current_user
    @favorite.save
    # TO DO : ADD CONFIRMATION MSG AND REFRESH
    # redirect_to: sitter_path
    # else
      # render :new
    # end
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
    params.require(:favorite).permit(:sitter_id)
  end
end
