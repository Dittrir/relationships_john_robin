require 'rails_helper'

RSpec.describe 'The Auto Shop creation' do
  it 'links to the new page from the autoshop index' do
    visit '/autoshops'

    click_link('New Auto Shop')
    expect(current_path).to eq('/autoshops/new')
  end

  it 'can create a new autoshop' do
    visit 'autoshops/new'

    fill_in('Name', with: 'Heavy Metal Repair')
    # fill_in('Open', with: true)
    # fill_in('Number of Vehicles Currently in the Shop', with: '4')
    click_button('Create Auto Shop')

    new_autoshop_id = Autoshop.last.id
    expect(current_path).to eq("/autoshops/#{new_autoshop_id}")
    expect(page).to have_content("Heavy Metal Repair")
  end
end
