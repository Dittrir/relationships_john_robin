require 'rails_helper'

RSpec.describe "Vehicles Show Page", type: :feature do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 0)
    @vehicle_1 = Vehicle.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = Vehicle.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = Vehicle.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'allows the user to return to the main page' do
    visit "/vehicles/#{@vehicle_1.id}"

    expect(page).to have_content("Back to Main")
  end

  it 'allows the viewer to visit the parent index page' do
    visit "/vehicles/#{@vehicle_1.id}"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit "/vehicles/#{@vehicle_1.id}"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'displays the vehicle name' do
    visit "/vehicles/#{@vehicle_1.id}"

    expect(page).to have_content(@vehicle_1.name)
  end
end
