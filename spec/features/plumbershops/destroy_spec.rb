require 'rails_helper'

RSpec.describe 'delete plumbershops' do
  before(:each) do
    @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @shop_2 = Plumbershop.create!(name: "NMI", service_offered: true, fleet_vehicles: 10)
    @plumber_1 = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_2 = @shop.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30) 
  end

  it 'can click the delete button and destroy plumbershops in show' do 
    visit "/plumbershops/#{@shop.id}"

    click_button "Delete PlumberShop"

    expect(current_path).to eq("/plumbershops")
    expect(page).to_not have_content(@shop.name)
  end
  
  it 'can click the delete button and destroy plumbershops in show' do 
    visit "/plumbershops/#{@shop.id}"

    click_button "Delete PlumberShop"

    expect(current_path).to eq("/plumbershops")
    expect(page).to_not have_content(@shop.name)
  end

  it 'can click the delete button on the index page' do 
    visit "/plumbershops"

    click_button "Delete #{@shop_2.name}"

    expect(current_path).to eq("/plumbershops")
    expect(page).to_not have_content(@shop_2.name)
  end
end