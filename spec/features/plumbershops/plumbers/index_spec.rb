require 'rails_helper'

RSpec.describe 'plumbershops plumbers index' do
  before(:each) do 
    @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @plumber_1 = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_2 = @shop.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it 'shows all of the names of the plumbers for the plumbershop' do
    visit "/plumbershops/#{@shop.id}/plumbers"

    expect(page).to have_content(@plumber_1.name)
    expect(page).to have_content(@plumber_2.name)
  end 

  it 'links to each plumbers show page' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    click_on @plumber_1.name

    expect(current_path).to eq("/plumbers/#{@plumber_1.id}")
  end

  it 'shows the average'
end