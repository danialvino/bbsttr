class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:create]
  load_and_authorize_resource param_method: :user_params
  def index
    @childs = Child.all
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(user_params)
    @child.user = @user
     if @child.save
      redirect_to children_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:child).permit(:gender, :age)
  end

  def set_user
    @user = current_user
  end

  def set_child
    @child = Child.find(params[:id])
  end

end
