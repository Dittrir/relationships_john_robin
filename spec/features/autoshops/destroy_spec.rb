#spec/features/autoshops/destroy_spec.rb.rb
require 'rails_helper'

RSpec.describe 'destroying an auto shop' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
  end

  it 'can delete the auto shop from the index page' do
    wrong_autoshop = Autoshop.create!(name: "Kar Shop", open: true, vehicles_in_shop: 3)

    visit '/autoshops'

    click_button "Delete #{wrong_autoshop.name}"

    expect(current_path).to eq('/autoshops')
    expect(page).to_not have_content('Kar Shop')
  end
end
