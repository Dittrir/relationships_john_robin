require 'rails_helper'

RSpec.describe 'Create new Plumbershops' do

  it 'can click create a new plumbershop' do 
    visit 'plumbershops'

    expect(page).to have_link("New PlumberShop")

    click_link "New PlumberShop"

    expect(current_path).to eq('/plumbershops/new')
  end 

  it 'can create a new plumbershop' do 
    visit '/plumbershops/new'

    fill_in('name', with: 'NMI')
    check 'service_offered'
    fill_in('fleet_vehicles', with: 5)

    click_button('Create PlumberShop')

    new_plumber_shop_id = Plumbershop.last.id

    expect(current_path).to eq("/plumbershops")
    expect(page).to have_content('NMI')
  end
end