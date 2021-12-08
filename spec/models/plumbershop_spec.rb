require 'rails_helper'

RSpec.describe Plumbershop do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @shop_2 = Plumbershop.create!(name: "NMI", service_offered: true, fleet_vehicles: 10)
    @shop_3 = Plumbershop.create!(name: "Bershinsky", service_offered: false, fleet_vehicles: 20)
    @plumber_1 = @shop_1.plumbers.create!(name: "Frank", license: "Journeyman", on_call: false, years_experience: 6)
    @plumber_2 = @shop_1.plumbers.create!(name: "Zelma", license: "Master", on_call: true, years_experience: 10)
    @plumber_3 = @shop_1.plumbers.create!(name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30)
  end

  it {should have_many :plumbers}

  it 'can order plumbershops by most recently created' do 
    expect(Plumbershop.sorted_by_most_recetly_created).to eq([@shop_3, @shop_2, @shop_1])
  end

  it 'can count plumber in plumbershop' do
    expect(@shop_1.plumber_count).to eq(3)
  end
end