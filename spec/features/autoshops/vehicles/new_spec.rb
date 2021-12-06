#spec/features/autoshops/vehicles/new_spec.rb
require 'rails_helper'

RSpec.describe 'The Auto Shop Vehicles creation' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'allows the user to return to the main page' do
    visit "autoshops/#{@shop_1.id}/vehicles/new"

    expect(page).to have_content("Back to Main")
  end

  it 'allows the viewer to visit the parent index page' do
    visit "autoshops/#{@shop_1.id}/vehicles/new"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit "autoshops/#{@shop_1.id}/vehicles/new"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'can create a Vehicle' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_link('Add Vehicle to Autoshop')
    expect(current_path).to eq("/autoshops/#{@shop_1.id}/vehicles/new")

    fill_in('Name', with: 'Heavy Metal Repair')
    check "Open"
    fill_in('Vehicles in shop', with: 4)
    click_button('Create Vehicle')

    new_autoshop_id = Autoshop.last.id #see if we even need this...
    expect(current_path).to eq("autoshops/#{@shop_1.id}/vehicles")
    expect(page).to have_content("Heavy Metal Repair")
    expect(page).to have_content(4)
  end
end
