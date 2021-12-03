require 'rails_helper'

RSpec.describe "Autoshops Index Page", type: :feature do
  it 'has text content' do

    visit "/autoshops"

    expect(page).to have_content("Auto Shops")
  end

  it 'can see all autoshops, whether or not they are open, and how many vehicles they are currently working on' do
    shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    shop_2 = Autoshop.create!(name: "Bongos", open: false, vehicles_in_shop: 20)

    visit "/autoshops"

    expect(page).to have_content(shop_1.name)
    expect(page).to have_content("Open: #{shop_1.open}")
    expect(page).to have_content("Vehicles in Shop: #{shop_1.vehicles_in_shop}")
    expect(page).to have_content(shop_2.name)
    expect(page).to have_content("Open: #{shop_2.open}")
    expect(page).to have_content("Vehicles in Shop: #{shop_2.vehicles_in_shop}")
  end

  it 'allows the user to return to the main page' do

    visit "/autoshops"

    expect(page).to have_content("Back to Main")
  end
end
