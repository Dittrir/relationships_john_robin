require 'rails_helper'

RSpec.describe 'displays' do
  before(:each) do
     @shop_1 = Plumbershop.create!(
      name: "IPS", service_offered: true, fleet_vehicles: 10
    )
    @shop_2 = Plumbershop.create!(
      name: "NMI", service_offered: false, fleet_vehicles: 20
    ) 
  end

  it 'displays a single shop with attributes' do 
    visit "/plumbershops/#{@shop_1.id}"
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content(@shop_1.service_offered)
    expect(page).to have_content(@shop_1.fleet_vehicles)
    expect(page).to_not have_content(@shop_2.name)
  end
end