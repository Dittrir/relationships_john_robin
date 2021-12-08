require 'rails_helper'

RSpec.describe Plumber do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = Plumber.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6, plumbershop_id: @shop_1.id)
    @plumber_2 = Plumber.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10, plumbershop_id: @shop_1.id)
    @plumber_3 = Plumber.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30, plumbershop_id: @shop_1.id)
  end

  it {should belong_to :plumbershop}

  it 'only lists the plumbers that return true for on_call' do 
    expect(Plumber.on_call?).to eq([@plumber_2])
  end

  it 'can alphabetize the plumbers' do 
    expect(Plumber.aplhabetical_order).to eq([@plumber_3, @plumber_1, @plumber_2])
  end
end