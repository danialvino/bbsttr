class Api::V1::AvailablesController < Api::V1::BaseController
  def index
    @availables = Available.where(sitter_id: current_user.sitter.id)
  end
end
