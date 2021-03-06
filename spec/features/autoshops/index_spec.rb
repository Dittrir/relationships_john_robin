#autoshops/vehicles/index_spec.rb
require 'rails_helper'

RSpec.describe "Autoshops Index Page", type: :feature do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @shop_2 = Autoshop.create!(name: "Bongos", open: false, vehicles_in_shop: 20)
  end

  it 'allows the user to return to the main page' do
    visit "/autoshops"

    expect(page).to have_content("Back to Main")
  end

  it 'has page text' do
    visit "/autoshops"

    expect(page).to have_content("Auto Shops")
  end

  it 'can see all autoshops, whether or not they are open, and how many vehicles they are currently working on' do
    visit "/autoshops"

    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content("Open: #{@shop_1.open}")
    expect(page).to have_content("Vehicles in Shop: #{@shop_1.vehicles_in_shop}")

    expect(page).to have_content(@shop_2.name)
    expect(page).to have_content("Open: #{@shop_2.open}")
    expect(page).to have_content("Vehicles in Shop: #{@shop_2.vehicles_in_shop}")
  end

  it 'allows the viewer to visit the parent index page' do
    visit "/vehicles/new"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit "/autoshops/new"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the parent index page from autoshop vehicles index page' do
    visit "autoshops/#{@shop_1.id}/vehicles"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to edit each parent' do
    visit "/autoshops"

    click_button("Edit #{@shop_1.name}")
    expect(current_path).to eq("/autoshops/#{@shop_1.id}/edit")
  end

  it 'allows the viewer to delete each parent' do
    visit "/autoshops"

    click_button("Delete #{@shop_1.name}")
    expect(current_path).to eq("/autoshops")

    expect(page).to_not have_content("#{@shop_1.name}")
  end

  it 'can create a new vehicle' do
    visit 'vehicles'

    click_link('Add A Vehicle')
    expect(current_path).to eq('/vehicles/new')

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
