class PlumbersController < ApplicationController
  def index
    @plumbers = Plumber.all.on_call?    
  end

  def show 
    @plumber = Plumber.find(params[:id])
  end

  def new
    @plumbershop = Plumbershop.find(params[:id])
  end

  def create
    @plumbershop = Plumbershop.find(params[:id])
    plumber = @plumbershop.plumbers.create!(plumber_params)
     
    redirect_to "/plumbershops/#{@plumbershop.id}/plumbers"
  end

  def edit 
    @plumber = Plumber.find(params[:id])
  end

  def update 
    @plumber = Plumber.find(params[:id])
    @plumber.update(plumber_params)
    redirect_to "/plumbers/#{@plumber.id}"
  end

  def destroy
    plumber = Plumber.find(params[:id])
    plumber.destroy
    redirect_to "/plumbers"
  end

  private
  def plumber_params 
    params.permit(:name, :license, :on_call, :years_experience)
  end
end