class PlumbershopsController < ApplicationController
  def index 
    @plumbershops = Plumbershop.sorted_by_most_recetly_created
  end

#   def new; end

  def show
    @plumbershop = Plumbershop.find(params[:id])
  end

#   def create 
#     shop = PlumberShop.new({
#       name: params[:plumbershop][:name],
#       service_offered: params[:plumbershop][:service_offered],
#       construction_offered: params[:plumbershop][:construction_offered],
#       fleet_vehicles: params[:plumbershopfleet_vehicles]
#     })
#   end
end