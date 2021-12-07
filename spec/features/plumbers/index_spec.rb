require 'rails_helper'

RSpec.describe 'plumbers show page' do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = Plumber.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6, plumbershop_id: @shop_1.id)
    @plumber_2 = Plumber.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10, plumbershop_id: @shop_1.id)
    @plumber_3 = Plumber.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30, plumbershop_id: @shop_1.id)
  end

  it 'displays all plumbers' do 
    visit "/plumbers"
    expect(page).to have_content(@plumber_1.name)
    expect(page).to have_content(@plumber_2.name)
    expect(page).to have_content(@plumber_3.name)
  end

  
  it 'I see a link at the top of the page that takes me to plumbers index' do 
    visit "/plumbers"
    
    click_link "Plumbers" 
    
    expect(current_path).to eq("/plumbers")
  end
  
  it 'has a plumbershops link' do 
    visit "/plumbers"
    
    click_link "PlumberShops"
    
    expect(current_path).to eq("/plumbershops")
  end

  it 'has a link to add plumbers' do 
    visit "/plumbers"

    expect(page).to have_link("New Plumber")
  end
end