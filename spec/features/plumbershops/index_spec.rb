require 'rails_helper'
 
RSpec.describe 'Plumber Shops' do
  before(:each) do
    @shop_1 = PlumberShop.create!(
      name: "IPS", service_offered: true, construction_offered:true, fleet_vehicles: 10
    )
    @shop_2 = PlumberShop.create!(
      name: "NMI", service_offered: false, construction_offered:true, fleet_vehicles: 20
    )
    @shop_3 = PlumberShop.create!(
      name: "Bershinsky Plumbing & Heating", service_offered: true, construction_offered:true, fleet_vehicles: 8
    ) 
  end
  
  it "displays all plumber shops" do 
    visit "/plumbershops"
    expect(page).to have_content("All Plumber Shops")
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content(@shop_2.name)
    expect(page).to have_content(@shop_3.name)
  end

  it "displays plumber shops as links" do 
    visit "/plumbershops"
    expect(page).to have_link(@shop_1.name)
    expect(page).to have_link(@shop_2.name)
    expect(page).to have_link(@shop_3.name)

    click_link "#{@shop_1.name}"
    expect(page).to have_current_path("/plumbershops/#{@shop_1.id}")
  end
end

