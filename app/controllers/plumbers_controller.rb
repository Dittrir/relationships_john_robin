class PlumbersController < ApplicationController
  def index
    @plumbers = Plumber.all
  end

  def show 
    @plumber = Plumber.find(params[:id])
  end
end