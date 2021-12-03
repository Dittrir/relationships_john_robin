require 'rails_helper'

RSpec.describe 'Autoshops vehicles index' do
  before(:each) do
    @shop_1 = Autoshop.create!(id:1, name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0)
  end

  it 'shows all the names of the vehicles in each autoshop' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    expect(page).to have_content(@vehicle_1.name)
    expect(page).to have_content(@vehicle_2.name)
    expect(page).to have_content(@vehicle_3.name)
  end

  it 'links to each vehicles show page' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_on @vehicle_1.name

    expect(current_path).to eq("/vehicles/#{@vehicle_1.id}")
  end

  it 'shows whether or not the vehicle needs a repair' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    expect(page).to have_content("Repair Needed: true")
  end
end
