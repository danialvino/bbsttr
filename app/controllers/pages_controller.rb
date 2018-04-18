class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy, :about]

  def home
  end

  def privacy_policy
  end

  def about
  end
end
