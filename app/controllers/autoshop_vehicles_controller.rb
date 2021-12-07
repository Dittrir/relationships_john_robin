class AutoshopVehiclesController < ApplicationController
  def index
    @autoshop = Autoshop.find(params[:autoshop_id])
    
    if params[:sort]
      @vehicles = @autoshop.vehicles.order_by_name
    else
      @vehicles = @autoshop.vehicles
    end
  end

  def new
    @autoshop = Autoshop.find(params[:id])
  end

  def create
    @autoshop = Autoshop.find(params[:autoshop_id])
    vehicle = @autoshop.vehicles.create(vehicle_params)
    redirect_to "/autoshops/#{@autoshop.id}/vehicles"
  end

private
  def vehicle_params
    params.permit(:name, :need_repair, :repair_cost)
  end
end
