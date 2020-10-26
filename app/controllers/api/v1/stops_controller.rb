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

  def delete_stop
    stop = Stop.find(params[:id])

    if stop.destroy
      render json: { "response": "SUCCESS" }
    else
      render json: { "response": "ERROR" }
    end
  end

  def filtered_stops

    if params[:search] == "client"
      stops = Stop.where(
        "mes = ? AND year = ? AND client != ? AND client != ? AND client != ? ",
        params[:mes], params[:year], "GASOLINA", "INCIDENTE", "BASURA"
      ).group_by { |x| x.client }

    elsif params[:search] == "basura"
      stops = Stop.where(
        "mes = ? AND year = ? AND client = ?",
        params[:mes], params[:year], "BASURA"
      ).group_by { |x| x.client }

    elsif params[:search] == "gasolina"
      stops = Stop.where(
        "mes = ? AND year = ? AND client = ?",
        params[:mes], params[:year], "GASOLINA"
      ).group_by { |x| x.client }

    elsif params[:search] == "incidente"
      stops = Stop.where(
        "mes = ? AND year = ? AND client = ?",
        params[:mes], params[:year], "INCIDENTE"
      ).group_by { |x| x.client }

    elsif params[:search] == "route"
      stops = Stop.where( "day = ?", params[:day] )
    end

    render json: {"stops": stops}
  end

  def get_stops
    @stops = Stop.where(route_id: params[:id])

    stops_response = []

    @stops.each do |stop|
      stops_response << { "client": stop.client, "lat": stop.lat, "lng": stop.lng }
    end

    render json: { "stops": stops_response, "response": "SUCCESS"}, status: :ok
  end


  private
  def require_params
    params.require(:stop).permit!
  end
end
