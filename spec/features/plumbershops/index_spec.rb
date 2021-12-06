require 'rails_helper'
 
RSpec.describe 'Plumber Shops' do
  before(:each) do
    @shop_1 = Plumbershop.create!(
      name: "IPS", service_offered: true, fleet_vehicles: 10
    )
    @shop_2 = Plumbershop.create!(
      name: "NMI", service_offered: true, fleet_vehicles: 10
    )
    @shop_3 = Plumbershop.create!(
      name: "Bershinsky", service_offered: false, fleet_vehicles: 20
    )
  end
  
  it "displays all plumber shops" do 
    visit "/plumbershops"
    expect(page).to have_content("All Plumber Shops")
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content(@shop_2.name)
    expect(page).to have_content(@shop_3.name)
  end

  it "sorts plumber shops in the order they were created" do 
    visit "/plumbershops"

    expect(@shop_3.name).to appear_before(@shop_2.name)
    expect(@shop_2.name).to appear_before(@shop_1.name)
  end
end

