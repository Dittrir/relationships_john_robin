require 'rails_helper'

RSpec.describe 'displays' do
  before(:each) do
     @shop_1 = PlumberShop.create!(
      name: "IPS", service_offered: true, construction_offered:true, fleet_vehicles: 10
    )
  end
end