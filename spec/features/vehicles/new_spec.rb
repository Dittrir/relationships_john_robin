#spec/features/vehicles/new_spec.rb
require 'rails_helper'

RSpec.describe 'The Vehicle creation' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'allows the user to return to the main page' do
    visit 'vehicles/new'

    expect(page).to have_content("Back to Main")
  end
  it 'allows the viewer to visit the parent index page' do
    visit 'vehicles/new'

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit 'vehicles/new'

    click_link('Go to Vehicles')
    expect(current_path).to eq('/vehicles')
  end

  it 'links to the new page from the parent index' do
    visit 'parents'

    click_link('Add A Vehicle')
    expect(current_path).to eq('/vehicles/new')
  end

  it 'can create a new vehicle' do
    visit 'vehicles/new'

    fill_in('Name', with: 'Toyota Rav 4')
    check "Need repair"
    fill_in('Repair cost', with: 1400)
    fill_in('Autoshop', with: @shop_1.id)
    click_button 'Create Vehicle'

    expect(current_path).to eq("/vehicles")
    expect(page).to have_content('Toyota Rav 4')
    expect(page).to have_content(1400)
  end
end
