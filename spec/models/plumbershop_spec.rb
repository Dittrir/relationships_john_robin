require 'rails_helper'

RSpec.describe Plumbershop do
  before(:each) do
    @shop_1 = Plumbershop.create!(name: "IPS", service_offered: true, fleet_vehicles: 10)
    @shop_2 = Plumbershop.create!(name: "NMI", service_offered: true, fleet_vehicles: 10)
    @shop_3 = Plumbershop.create!(name: "Bershinsky", service_offered: false, fleet_vehicles: 20)
  end

  it {should have_many :plumbers}

  it 'can order plumbershops by most recently created' do 
    expect(Plumbershop.sorted_by_most_recetly_created).to eq([@shop_3, @shop_2, @shop_1])
  end
end