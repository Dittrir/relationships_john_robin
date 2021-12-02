require 'rails_helper' 

RSpec.describe 'plumbing shops show page' do 
  it 'displays the plumbing shop name' do
     plumbing_shop = PlumbingShop.create!(
       name: "Georgies", 
       service_offered: true, 
       construction_offered: true, 
       fleet_vehicles: 5
     )
    visit "/plumbingshops/#{plumbing_shop.id}"
    expect(page).to have_content(plumbing_shop.name)
  end
end