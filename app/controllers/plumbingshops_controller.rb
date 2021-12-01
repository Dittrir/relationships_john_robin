class PlumbingshopsController < ApplicationController
  def index 
    @plumbing_shops = PlumbingShop.all
  end

  def new; end

  def show
    @plumbing_shop = PlumbingShop.find(params[:id])
  end

  def create 
    shop = PlumbingShop.new({
      name: params[:plumbingshop][:name],
      service_offered: params[:plumbingshop][:service_offered],
      construction_offered: params[:plumbingshop][:construction_offered],
      fleet_vehicles: params[:plumbingshopfleet_vehicles]
    })
  end
end