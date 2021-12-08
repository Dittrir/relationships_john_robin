class PlumbershopsController < ApplicationController
  def index 
    @plumbershops = Plumbershop.sorted_by_most_recetly_created
  end

  def new
  end

  def show
    @plumbershop = Plumbershop.find(params[:id])
  end

  def create 
    plumbershop = Plumbershop.create!(plumbershop_params)
    plumbershop.save 
    
    redirect_to "/plumbershops"
  end

  def edit 
    @plumbershop = Plumbershop.find(params[:id])
  end

  def update
    plumbershop = Plumbershop.find(params[:id])
    plumbershop.update(plumbershop_params)
    redirect_to "/plumbershops/#{plumbershop.id}"
  end

  def destroy 
    plumbershop = Plumbershop.find(params[:id])
    plumbershop.destroy
    
    redirect_to "/plumbershops"
  end

  private
  def plumbershop_params
    params.permit(:name, :service_offered, :fleet_vehicles)
  end
end