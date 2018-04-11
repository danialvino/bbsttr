class BankInfosController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @bank_info = BankInfo.find(params[:id])
  end

  def new
    @bank_info = BankInfo.new
  end

  def create
    @bank_info = BankInfo.new(user_params)
    @sitter = Sitter.find(current_user.id)
    @bank_info.sitter = @sitter
    if @bank_info.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @bank_info = BankInfo.find(params[:id])
  end

  def update
    @bank_info = BankInfo.find(params[:id])
    @bank_info.update(user_params)
  end

  private

  def user_params
    params.require(:bank_info).permit(:agency, :account, :bank, :cpf, :sitter_id)
  end
end
