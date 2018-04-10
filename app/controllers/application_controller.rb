class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :birthday, :gender, :address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :birthday, :gender, :address])
  end
end
