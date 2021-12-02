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
end
