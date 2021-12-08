require 'rails_helper'

RSpec.describe 'can delete plumbers from plumbershops/plumbers index' do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = @shop_1.plumbers.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6)
    @plumber_2 = @shop_1.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_3 = @shop_1.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it 'has a delete button' do 
    visit "/plumbershops/#{@shop_1.id}/plumbers"

    expect(page).to have_button("Delete #{@plumber_1.name}")
  end

  it 'can click delete button' do 
    visit "/plumbershops/#{@shop_1.id}/plumbers"

    click_button "Delete #{@plumber_1.name}" 

    expect(current_path).to eq("/plumbers")
    expect(page).to_not have_content(@plumber_1.name)
  end
end