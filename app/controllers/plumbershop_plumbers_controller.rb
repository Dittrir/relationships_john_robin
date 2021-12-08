class PlumbershopPlumbersController < ApplicationController 
  def index
    @plumbershop = Plumbershop.find(params[:id])
    if params[:sort]
      @plumbers = @plumbershop.plumbers.aplhabetical_order
    else 
      @plumbers = @plumbershop.plumbers
    end
  end
end