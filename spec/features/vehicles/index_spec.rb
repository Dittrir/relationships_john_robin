#spec/features/vehicles/index_spec.rb
require 'rails_helper'

RSpec.describe "Vehicles Index Page", type: :feature do
  before(:each) do
    @shop_1 = Autoshop.create!(id: 1, name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = Vehicle.create!(autoshop_id: 1, name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500)
    @vehicle_2 = Vehicle.create!(autoshop_id: 1, name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800)
    @vehicle_3 = Vehicle.create!(autoshop_id: 1, name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0)

  end

  it 'has text content' do
    visit "/vehicles"

    expect(page).to have_content("Vehicles")
  end

  it 'can see all vehicles, whether or not they need a repair, and the repair cost' do
    visit "/vehicles"

    expect(page).to have_content(@vehicle_1.name)
    expect(page).to have_content("Repair Needed: #{@vehicle_1.need_repair}")
    expect(page).to have_content("Repair Cost: #{@vehicle_1.repair_cost}")
    expect(page).to have_content("Created at: #{@vehicle_1.created_at}")
    expect(page).to have_content("Updated at: #{@vehicle_1.updated_at}")
    expect(page).to have_content(@vehicle_2.name)
    expect(page).to have_content("Repair Needed: #{@vehicle_2.need_repair}")
    expect(page).to have_content("Repair Cost: #{@vehicle_2.repair_cost}")
    expect(page).to have_content("Created at: #{@vehicle_2.created_at}")
    expect(page).to have_content("Updated at: #{@vehicle_2.updated_at}")
  end

  it 'allows the user to return to the main page' do
    visit "/vehicles"

    expect(page).to have_content("Back to Main")
  end

  it 'allows the viewer to visit the parent index page from child index page' do
    visit "/vehicles"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page from new child page' do
    visit "/vehicles/new"

    click_link('Go to Vehicles')
    expect(current_path).to eq('/vehicles')
  end

  it 'allows the viewer to visit the child index page from autoshop vehicles index page' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_link('Go to Vehicles')
    expect(current_path).to eq('/vehicles')
  end
end
