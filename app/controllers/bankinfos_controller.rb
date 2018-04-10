class BankinfosController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @bankinfo = Bankinfo.find(params[:id])
  end

  def new
    @bankinfo = Bankinfo.new
  end

  def create
    @bankinfo = Bankinfo.new(user_params)
    @sitter = Sitter.find(current_user.id)
    @bankinfo.sitter = @sitter
    if @bankinfo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @bankinfo = Bankinfo.find(params[:id])
  end

  def update
    @bankinfo = Bankinfo.find(params[:id])
    @bankinfo.update(user_params)
  end

  private

  def user_params
    params.require(:bankinfo).permit(:agency, :account, :bank, :cpf, :sitter_id)
  end
end
