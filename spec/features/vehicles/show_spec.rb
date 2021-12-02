require 'rails_helper'

RSpec.describe "Vehicles Show Page", type: :feature do
  it 'displays the vehicle name' do
    vehicle_1 = Vehicle.create!(shop_id: 1, name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500)

    visit "/vehicles/#{vehicle_1.id}"

    expect(page).to have_content(vehicle_1.name)
  end
end
