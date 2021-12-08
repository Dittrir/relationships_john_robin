class PlumbershopPlumbersController < ApplicationController 
  def index
    @plumbershop = Plumbershop.find(params[:id])
    if params[:sort]
      @plumbers = @plumbershop.plumbers.aplhabetical_order
    elsif params[:search]
      @plumbers = @plumbershop.plumbers.given_threshold(params[:search])
    else 
      @plumbers = @plumbershop.plumbers
    end
  end
end