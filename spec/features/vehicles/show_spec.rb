require 'rails_helper'

RSpec.describe "Vehicles Show Page", type: :feature do
  it 'displays the vehicle name' do
    shop_1 = Autoshop.create!(id: 1, name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    vehicle_1 = Vehicle.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id:1)

    visit "/vehicles/#{vehicle_1.id}"

    expect(page).to have_content(vehicle_1.name)
  end
end
