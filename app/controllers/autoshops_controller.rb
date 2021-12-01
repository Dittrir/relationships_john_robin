class AutoshopsController < ApplicationController
  def index
    @autoshops = Autoshop.all
  end

  def show
    @autoshop = Autoshop.find(params[:id])
  end
end
