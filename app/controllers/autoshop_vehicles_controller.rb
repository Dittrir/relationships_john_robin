class AutoshopVehiclesController < ApplicationController
  def index
    @autoshop = Autoshop.find(params[:autoshop_id])
    @vehicles = @autoshop.vehicles
  end

  def new
  end

  def create
    @autoshop = Autoshop.find(params[:autoshop_id])
    vehicle = @autoshop.vehicles.create(autoshop_params)
    redirect_to "/autoshops/#{@autoshop.id}/vehicles"
  end

private
  def autoshop_params
    params.permit(:name, :need_repair, :repair_cost)
  end
end
