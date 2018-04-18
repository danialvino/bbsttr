class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_back(fallback_location: root_path, alert: "(Error 403): Sua conta não tem permissão de fazer esta ação.")
    else
      redirect_to new_user_registration_path
    end
  end

  private

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :birthday, :gender, :address, :photo, :photo_cache])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :birthday, :gender, :address, :photo, :photo_cache])
  end
end
