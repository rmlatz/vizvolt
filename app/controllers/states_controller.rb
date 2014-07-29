class StatesController < ApplicationController
  respond_to :json

  def index
    results = State.get_us_totals
    render json: results
  end

  def show
    s = params[:state]
    y = params[:year]
    state_results = State.get_state_info(s, y)
    render json: state_results
  end
end
