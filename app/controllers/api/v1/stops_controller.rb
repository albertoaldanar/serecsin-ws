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

  def filtered_stops

    if params[:search] == "client"
      stops = Stop.where(
        "mes = ? AND year = ? AND client != ? AND client != ? AND client != ? ",
        params[:mes], params[:year], "GASOLINA", "INCIDENTE", "BASURA"
      ).group_by { |x| x.client }


      # h = Foo.all.group_by { |x| x.bar }
      # h.each {|key, value| value.each {|foo| puts foo['bar'] }}

      # Event
      # .order(:popularity)
      # .joins(:keywords)
      # .group('events.id') # <======
      # .where(keywords: { category: 'taxonomy' })
      # .group('keywords.name')

      # stops = {}
      # stops

      # stps.each do |t|
      #     stops[t.client] = [
      #         {
      #           comments: t.comments,
      #           hour: t.created_at,
      #           photos: t.photos,
      #           signature: t.signature,
      #           day: t.day,
      #           fail: t.fail,
      #           gas: t.gas,
      #         }
      #     ]
      # end

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
