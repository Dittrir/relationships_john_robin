class AutoshopVehiclesController < ApplicationController
  def index
    @autoshop = Autoshop.find(params[:autoshop_id])
    @vehicles = @autoshop.vehicles
  end

  def new
  end
end
