class PlumbersController < ApplicationController
  def index
    @plumbers = Plumber.all
  end

  def show 
    @plumber = Plumber.find(params[:id])
  end

  def new; end

  def create
    plumbershop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    plumber = plumbershop.plumbers.create!(plumber_params)
    redirect_to '/plumbers'
  end

  private
  def plumber_params 
    params.permit(:name, :license, :on_call, :years_experience)
  end
end