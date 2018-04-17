class FavoritesController < ApplicationController
  skip_before_action :authenticate_user!
  load_and_authorize_resource param_method: :user_params
  def index
    @favorites = Favorite.where(user: current_user)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(user_params)
    @favorite.user = current_user
    if @favorite.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "Deu erro"
    end
  end

  private

  def user_params
    params.require(:favorite).permit(:sitter_id)
  end
end
