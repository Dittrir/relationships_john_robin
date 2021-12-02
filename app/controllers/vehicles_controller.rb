class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicles = Vehicle.find(params[:id])
  end
end
