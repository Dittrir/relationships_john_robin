#spec/features/vehicles/edit_spec.rb
require 'rails_helper'

RSpec.describe 'the vehicle edit' do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
    @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
    @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
    @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
    @vehicle_4 = @shop_1.vehicles.create!(name: "Porsche 911", need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
  end
  it 'allows the user to return to the main page' do
    visit "/vehicles/#{@vehicle_4.id}"

    expect(page).to have_content("Back to Main")
  end

  it 'links to the edit page' do
    visit "/vehicles/#{@vehicle_4.id}"

    click_link "Edit"

    expect(current_path).to eq("/vehicles/#{@vehicle_4.id}/edit")
  end

  it 'can edit the vehicle' do
    wrong_vehicle = @shop_1.vehicles.create!(name: 'Pors', need_repair: true, repair_cost: 800)
    visit "/vehicles/#{wrong_vehicle.id}"

    expect(page).to have_content('Pors')

    click_link "Edit"

    fill_in('Name', with: 'Porsche 911')
    check "Need repair" #<<<<<
    fill_in('Repair cost', with: 800) #<<<<
    click_button('Update Vehicle')

    expect(current_path).to eq("/vehicles/#{wrong_vehicle.id}")
    expect(page).to have_content('Porsche 911')
    #Test expectations of new form additions Open and 14
  end
end
