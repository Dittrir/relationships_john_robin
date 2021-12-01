class PlumbingshopsController < ApplicationController
  def index 

  end

  def new; end

  def create 
    shop = PlumbingShop.new({
      name: params[:plumbingshop][:name],
      service_offered: params[:plumbingshop][:service_offered],
      construction_offered: params[:plumbingshop][:construction_offered],
      fleet_vehicles: params[:plumbingshopfleet_vehicles]
    })
  end
end