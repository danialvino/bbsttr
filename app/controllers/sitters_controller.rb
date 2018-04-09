class SittersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @sitters = Sitter.all
  end
end
