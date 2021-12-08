require 'rails_helper'

RSpec.describe 'delete plumebrs' do
  before(:each) do
     @shop = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @shop_2 = Plumbershop.create!(name: "NMI", service_offered: true, fleet_vehicles: 10)
    @plumber_1 = @shop.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_2 = @shop.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30) 
  end

  it 'can click delete button and destroy plumbers' do 
    visit "/plumbers"

    click_button "Delete Plumber #{@plumber_1.name}"

    expect(current_path).to eq("/plumbers")
    expect(page).to_not have_content(@plumber_1.name)
  end 
end