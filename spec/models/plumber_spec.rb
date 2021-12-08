require 'rails_helper'

RSpec.describe Plumber do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10) 
    @plumber_1 = @shop_1.plumbers.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6)
    @plumber_2 = @shop_1.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_3 = @shop_1.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it {should belong_to :plumbershop}

  it 'only lists the plumbers that return true for on_call' do 
    expect(Plumber.on_call?).to eq([@plumber_2])
  end

  it 'can alphabetize the plumbers' do 
    expect(Plumber.aplhabetical_order).to eq([@plumber_3, @plumber_1, @plumber_2])
  end

  it 'can return plumbers greater than a given threshold' do 
    expect(Plumber.given_threshold(20)).to eq([@plumber_3])
  end
end