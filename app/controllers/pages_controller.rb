class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy]

  def home
  end

  def privacy_policy
  end
end
