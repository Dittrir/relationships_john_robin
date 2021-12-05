class AutoshopsController < ApplicationController
  def index
    @autoshops = Autoshop.sort_created_at
  end

  def show
    @autoshop = Autoshop.find(params[:id])
  end

  def new
  end

  def create
    autoshop = Autoshop.create(autoshop_params)
    redirect_to "/autoshops/#{autoshop.id}"
  end

  def edit
    @autoshop = Autoshop.find(params[:id])
  end

  def update
    @autoshop = Autoshop.find(params[:id])
    @autoshop.update(autoshop_params)
    redirect_to '/autoshops'
  end

private
  def autoshop_params
    params.permit(:name)
  end
end
