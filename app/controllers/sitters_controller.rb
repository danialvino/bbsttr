class SittersController < ApplicationController

  def index
    if params[:start_time].present? && params[:end_time].present?
      @sitters = Sitter.all
      @result = available?(@sitters)
    else
      @sitters = Sitter.all
    end
  end

  def show
    @sitter = Sitter.find(params[:id])
  end

  def new
    if current_user.sitter?
      redirect_to root_path, alert: "Você já é uma babá!"
    else
      @sitter = Sitter.new
      @sitter.build_bankinfo
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
  end

  def update
    @sitter = Sitter.find(params[:id])
    if @sitter.update!(user_params)
      redirect_to root_path, notice: "Update de infos com sucesso"
    end
  end

  private

  def user_params
    params.require(:sitter).permit(:pay_rate, :about, :skills, :user_id)
  end
# , :bankinfo => [:agency, :account, :cpf, :bank]
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
end
      # Search params
      # <%= form_tag sitters_path, method: :get do %>
      #   <%= text_field_tag :start_time,
      #     params[:start_time],
      #     class: "daterange",
      #     style: "color: black;"
      #   %>
      #   <%= text_field_tag :end_time,
      #     params[:end_time],
      #     class: "daterange",
      #     style: "color: black;"
      #   %>
      #   <%= submit_tag %>
      # <% end %>
