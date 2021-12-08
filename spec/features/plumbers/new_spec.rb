require 'rails_helper'

RSpec.describe 'create new plumbers' do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = @shop_1.plumbers.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6)
    @plumber_2 = @shop_1.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_3 = @shop_1.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it 'can click the create a new plumber link' do 
    visit "/plumbershops/#{@shop_1.id}/plumbers" 

    click_link 'New Plumber' 
    
    expect(current_path).to eq("/plumbershops/#{@shop_1.id}/plumbers/new")
  end

  it 'can create a plumber' do 
    visit "/plumbershops/#{@shop_1.id}/plumbers/new"
    fill_in('name', with: 'Jimmy')
    fill_in('license', with: "Residential")
    check 'on_call'
    fill_in('years_experience', with: 5)

    click_button("Create Plumber")

    expect(current_path).to eq("/plumbershops/#{@shop_1.id}/plumbers")
    expect(page).to have_content('Jimmy')
  end
end