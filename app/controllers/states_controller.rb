class StatesController < ApplicationController
  respond_to :json

  def index

    # Gather all States data
    @states = State.all

    # Respond to request with state data in json format
    render json: @states

  end

end
