require 'rails_helper'

RSpec.describe 'displays' do
  before(:each) do
    @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @shop_2 = Plumbershop.create!(name: "NMI", service_offered: true, fleet_vehicles: 10)
    @plumber_1 = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_2 = @shop.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30) 
  end

  it 'displays a single shop with attributes' do 
    visit "/plumbershops/#{@shop.id}"
    expect(page).to have_content(@shop.id)
    expect(page).to have_content(@shop.name)
    expect(page).to have_content(@shop.service_offered)
    expect(page).to have_content(@shop.fleet_vehicles)
    expect(page).to have_content(@shop.created_at)
    expect(page).to have_content(@shop.updated_at)
    expect(page).to_not have_content(@shop_2.name)
  end

      # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
  it 'can list the number of plumbers for a plumbershop' do 
    visit "/plumbershops/#{@shop.id}"

    expect(page).to have_content("Number of Plumbers: #{@shop.plumber_count}")
  end

  it 'has link to update plumbreshop' do 
    visit "/plumbershops/#{@shop.id}"
    
    expect(page).to have_link("Update PlumberShop")
  end

  it 'has a plumbers link' do 
    visit "/plumbershops/#{@shop.id}"

    click_link "Plumbers"

    expect(current_path).to eq("/plumbers")
  end

  it 'has a plumbershops link' do 
    visit "/plumbershops/#{@shop.id}"

    click_link "PlumberShops"
    
    expect(current_path).to eq("/plumbershops")
  end
end