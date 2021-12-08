#spec/features/autoshops/vehicles/index_spec.rb
require 'rails_helper'

RSpec.describe 'Autoshops vehicles index' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'allows the user to return to the main page' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    expect(page).to have_content("Back to Main")
  end

  it 'shows all the attributes of the vehicles in each autoshop' do
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

  it 'shows the vehicles repair cost' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    expect(page).to have_content("Repair Cost: 3500")
  end

  it 'allows the user to add a new adoptable child for that parent' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_link('Add Vehicle to Autoshop')
    expect(current_path).to eq("/autoshops/#{@shop_1.id}/vehicles/new")
  end

  it 'provides a link that sorts the children in alphabetical order' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_link "Sort vehicles alphabetically"

    expect(current_path).to eq("/autoshops/#{@shop_1.id}/vehicles")
  end

  it 'has a button to edit the vehicle info' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_button "Edit #{@vehicle_1.name}"

    expect(current_path).to eq("/vehicles/#{@vehicle_1.id}/edit")
  end

  it 'allows the viewer to delete each child' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_button("Delete #{@vehicle_1.name}")
    expect(current_path).to eq("/vehicles")

    expect(page).to_not have_content("#{@vehicle_1.name}")
  end

  it 'allows the viewer to access form to return number of column' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    fill_in 'Repair Cost More Than', with:1000
    click_button 'Submit'

    expect(current_path).to eq("/autoshops/#{@shop_1.id}/vehicles")
  end
end
