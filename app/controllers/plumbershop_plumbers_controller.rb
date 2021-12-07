class PlumbershopPlumbersController < ApplicationController 
  def index
    plumbershop = Plumbershop.find(params[:id])
    @plumbers = plumbershop.plumbers
  end
end