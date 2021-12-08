require 'rails_helper'

RSpec.describe 'Edit Plumbershops' do
  before(:each) do
    @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
  end

  it 'links to the edit page' do 
    visit "/plumbershops/#{@shop.id}"

    click_link "Update PlumberShop"

    expect(current_path).to eq("/plumbershops/#{@shop.id}/edit")
  end

  it 'can edit a plumbershop' do 
    plumbershop = Plumbershop.create!(name: "IP", service_offered: true, fleet_vehicles: 10)

    visit "/plumbershops/#{plumbershop.id}/edit"

    fill_in('Name', with: "IPS")
    uncheck "service_offered"
    fill_in('fleet_vehicles', with: 10)

    click_button 'Update PlumberShop'

    expect(current_path).to eq("/plumbershops/#{plumbershop.id}")
    expect(page).to have_content("IPS")
  end
end