require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = @shop_1.plumbers.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6)
    @plumber_2 = @shop_1.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_3 = @shop_1.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it 'displays a single plumber with attributes' do 
    visit "/plumbers/#{@plumber_2.id}"
    expect(page).to have_content(@plumber_2.id)
    expect(page).to have_content(@plumber_2.name)
    expect(page).to have_content(@plumber_2.license)
    expect(page).to have_content(@plumber_2.on_call)
    expect(page).to have_content(@plumber_2.years_experience)
    expect(page).to have_content(@plumber_2.created_at)
    expect(page).to have_content(@plumber_2.updated_at)
    expect(page).to_not have_content(@plumber_1.name)
    expect(page).to_not have_content(@plumber_3.name)
  end

  it 'has a plumbers link' do 
    visit "/plumbers/#{@plumber_2.id}"

    click_link "Plumbers"

    expect(current_path).to eq("/plumbers")
  end

  it 'has a plumbershops link' do 
    visit "/plumbers/#{@plumber_2.id}"

    click_link "PlumberShops"
    
    expect(current_path).to eq("/plumbershops")
  end

  it 'has an update link' do 
    visit "/plumbers/#{@plumber_2.id}"
     
    expect(page).to have_link("Update Plumber")
  end

  it 'has a delete plumber button' do 
    visit "/plumbers/#{@plumber_2.id}"

    expect(page).to have_button("Delete Plumber")
  end
end