class PlumbersController < ApplicationController
  def index
    @plumbers = Plumber.all.on_call?
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

  def edit 
    @plumber = Plumber.find(params[:id])
  end

  def update 
    plumber = Plumber.find(params[:id])
    plumber.update(plumber_params)
    redirect_to "/plumbers/#{plumber.id}"
  end

  private
  def plumber_params 
    params.permit(:name, :license, :on_call, :years_experience)
  end
end