#spec/features/vehicless/destroy_spec.rb.rb
require 'rails_helper'

RSpec.describe 'destroying a vehicle' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'can delete the vehicle from the index page' do
    sad_car_1 = @shop_1.vehicles.create!(name: 'CHRa', need_repair: true, repair_cost: 1100, autoshop_id: @shop_1.id)
    visit '/vehicles'

    click_button "Delete #{sad_car_1.name}"

    expect(current_path).to eq('/vehicles')
    expect(page).to_not have_content('CHRa')
  end
end
