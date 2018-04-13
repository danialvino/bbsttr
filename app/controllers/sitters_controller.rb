class SittersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:start_time].present? && params[:end_time].present? && params[:user_address].present?
      cookies["start_time"] = params[:start_time]
      cookies["end_time"] = params[:end_time]
      cookies["user_address"] = params[:user_address]
      @result = near?(Sitter.all)
      @sitters = available?(@result)
      @result_availables = available_hours?(@sitters)
      @favorite = Favorite.new
     elsif params[:start_time].present? && params[:end_time].present?
      cookies["start_time"] = params[:start_time]
      cookies["end_time"] = params[:end_time]
      @result = near?(Sitter.all)
      @sitters = available?(@result)
      @result_availables = available_hours?(@sitters)
      @favorite = Favorite.new
     else
      redirect_to root_path, alert: "Para quando você precisa a babá?"
    end
  end

  def show
    @sitter = Sitter.find(params[:id])
    @favorite = Favorite.new
  end

  def new
    if current_user.sitter?
      redirect_to root_path, alert: "Você já é uma babá!"
    else
      @sitter = Sitter.new
      @sitter.build_bank_info
    end
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

  def edit
    @sitter = Sitter.find(params[:id])
    if @sitter.bank_info.nil?
      @sitter.build_bank_info
    end
  end

  def update
    @sitter = Sitter.find(params[:id])
    # @bank_info = @sitter.bank_info
    if @sitter.update!(user_params)
      redirect_to root_path, notice: "Update de infos com sucesso"
    end
  end

  private

  def user_params
    params.require(:sitter).permit(:price, :about, :user_id,
     :bank_info_attributes => [:agency, :account, :cpf, :bank, :id], skills: [])
  end

# Checks an array of sitters if they are available inside the params given in the search
  def available?(sitters)
      @available_sitters = []
      sitters.each do |sitter|
       availabledates = sitter.availables
       availabledates.each do |h|
        daterange = (h.start_time..h.end_time)
        if daterange.cover?(params[:start_time].to_datetime) && daterange.cover?(params[:end_time].to_datetime)
           @available_sitters << sitter
        end
      end
    end
    return @available_sitters
  end

    def available_hours?(sitters)
      @available_hours = []
      sitters.each do |sitter|
       availabledates = sitter.availables
       availabledates.each do |h|
        daterange = (h.start_time..h.end_time)
        if daterange.cover?(params[:start_time].to_datetime) && daterange.cover?(params[:end_time].to_datetime)
           @available_hours << h
        end
      end
    end
    return @available_hours
  end

  # creating an array with all available baby-sitters living less than X km from parent
  def near?(sitters)
    @sitters_near = []
    sitters.each do |sitter|
      if params[:user_address].present?
        if Geocoder::Calculations.distance_between(params[:user_address], sitter.user) < 20
          @sitters_near << sitter
        end
      else
        if Geocoder::Calculations.distance_between(current_user, sitter.user) < 20
          @sitters_near << sitter
        end
      end
    end
    return @sitters_near
  end

end
      # Search params

