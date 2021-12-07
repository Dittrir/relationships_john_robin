class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    redirect_to "/vehicles/#{@vehicle.id}"
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to '/vehicles'
  end

private
  def vehicle_params
    params.permit(:name, :need_repair, :repair_cost)
  end
end
