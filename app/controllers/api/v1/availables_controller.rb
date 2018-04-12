class Api::V1::AvailablesController < Api::V1::BaseController
  def index
    @availables = Available.all
  end
end
