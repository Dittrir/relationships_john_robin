#spec/features/autoshops/new_spec.rb
require 'rails_helper'

RSpec.describe 'The Auto Shop creation' do
  it 'allows the user to return to the main page' do
    visit 'autoshops/new'

    expect(page).to have_content("Back to Main")
  end
  it 'allows the viewer to visit the parent index page' do
    visit 'autoshops/new'

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit 'autoshops/new'

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'links to the new page from the autoshop index' do
    visit '/autoshops'

    click_link('New Auto Shop')
    expect(current_path).to eq('/autoshops/new')
  end

  it 'can create a new autoshop' do
    visit 'autoshops/new'

    fill_in('Name', with: 'Heavy Metal Repair')
    check "Open"
    fill_in('Vehicles in shop', with: 4)
    click_button('Create Auto Shop')

    new_autoshop_id = Autoshop.last.id
    expect(current_path).to eq("/autoshops/#{new_autoshop_id}")
    expect(page).to have_content("Heavy Metal Repair")
    expect(page).to have_content(4)
  end
end
