class Api::V1::RoutesController < ApplicationController

  def create_route
    @route = Route.new(require_params)

    if @route.save
      render json: { "route": @route, "response": "SUCCESS"}, status: :ok
    else
      render json: { error: @route.errors, is_success: false}, status: 422
    end
  end

  def finish_route
    route = Route.find(params[:id])
    route.done = true
    route.lt_done = params[:lt]

    if route.save
      render json: { "route": route, "response": "SUCCESS"}, status: :ok
    end
  end

  private
  def require_params
    params.require(:route).permit!
  end
end
