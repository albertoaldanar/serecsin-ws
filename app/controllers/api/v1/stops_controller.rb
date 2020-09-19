class Api::V1::StopsController < ApplicationController

  def create_stop
    @stop = Stop.new(require_params)

    if @stop.save
      render json: { "stop": @stop, "response": "SUCCESS"}, status: :ok
    else
      render json: { error: @stop.errors, is_success: false}, status: 422
    end
  end

  def all_stops
    @stops = Stop.all
    render json: {"stops": @stops}
  end

  def delete_stops
    @stops = Stop.destroy_all

    render json: {"stops": @stops}
  end


  def get_stops
    @stops = Stop.where(route_id: params[:id])
    render json: { "stops": @stops, "response": "SUCCESS"}, status: :ok
  end

  private
  def require_params
    params.require(:stop).permit!
  end
end
