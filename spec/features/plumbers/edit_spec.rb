require 'rails_helper'

RSpec.describe 'Edits Plumbers' do
  before(:each) do
    @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @plumber = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
  end

  it 'can link to the edit page' do 
    visit "/plumbers/#{@plumber.id}"

    click_link "Update Plumber" 

    expect(current_path).to eq("/plumbers/#{@plumber.id}/edit")
  end

  it 'can edit a plumber' do 
    visit "/plumbers/#{@plumber.id}/edit"

    uncheck "on_call"
    fill_in("years_experience", with: 2)
    click_on "Update Plumber"

    expect(current_path).to eq("/plumbers/#{@plumber.id}")
    expect(page).to have_content(2)
  end
end