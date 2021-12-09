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

  it 'has a plumbers link' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    click_link "Plumbers"

    expect(current_path).to eq("/plumbers")
  end

  it 'has a plumbershops link' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    click_link "PlumberShops"
    
    expect(current_path).to eq("/plumbershops")
  end

  it 'has a link to aplhabetically sort the plumbers' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    expect(page).to have_link("Alphabetize Plumbers")
    expect(current_path).to eq("/plumbershops/#{@shop.id}/plumbers")
  end

  it 'can click link to aplhabetically sort the plumbers' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    click_link "Alphabetize Plumbers"

    expect(current_path).to eq("/plumbershops/#{@shop.id}/plumbers")
    expect(@plumber_2.name).to appear_before(@plumber_1.name)
  end

  it 'displays records over a given treshold' do 
    visit "/plumbershops/#{@shop.id}/plumbers"

    fill_in 'Desired Years Of Experience', with: 20
    click_button 'Submit'

    expect(page).to have_content(@plumber_2.name)
    expect(page).to_not have_content(@plumber_1.name)
  end
end

