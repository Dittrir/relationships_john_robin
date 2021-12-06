require 'rails_helper'

RSpec.describe '' do
  before(:each) do
     @shop_1 = Plumbershop.create!(
      name: "IPS", service_offered: true, fleet_vehicles: 10
      ) 
    @plumber_1 = Plumber.create!(
      name: "Frank", license: "Journeyman", on_call: false, years_experience: 6, plumbershop_id: @shop_1.id
      )
    @plumber_2 = Plumber.create!(
      name: "Zelma", license: "Master", on_call: true, years_experience: 10, plumbershop_id: @shop_1.id
      )
    @plumber_3 = Plumber.create!(
      name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30, plumbershop_id: @shop_1.id
      )
  end

  it 'displays a single plumber with attributes' do 
    visit "/plumbers/#{@plumber_2.id}"
    expect(page).to have_content(@plumber_2.id)
    expect(page).to have_content(@plumber_2.name)
    expect(page).to have_content(@plumber_2.license)
    expect(page).to have_content(@plumber_2.on_call)
    expect(page).to have_content(@plumber_2.years_experience)
    expect(page).to have_content(@plumber_2.created_at)
    expect(page).to have_content(@plumber_2.updated_at)
    expect(page).to_not have_content(@plumber_1.name)
    expect(page).to_not have_content(@plumber_3.name)
  end
end