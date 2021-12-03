class PlumbershopPlumbersController < ApplicationController 
  def index
    plumbershop = Plumbershop.find(params[:plumbershop_id])
    @plumbers = plumbershop.plumbers
  end
end