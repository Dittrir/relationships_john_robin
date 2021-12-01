class AutoshopsController < ApplicationController
  def index
    @autoshops = Autoshop.all
  end

  def new
  end

  def show
    @autoshops = Autoshop.find(params[:id])
  end

  def edit
    @autoshops = Autoshop.find(params[:id])
  end
end
