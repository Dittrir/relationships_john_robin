require 'rails_helper'

RSpec.describe 'the autoshop edit' do
  it 'links to the edit page' do
    autoshop = Autoshop.create!(name: 'Heavy Metal Repair Shop')

    visit '/autoshops'

    click_button "Edit #{autoshop.name}"

    expect(current_path).to eq("/autoshops/#{autoshop.id}/edit")
  end

  it 'can edit the autoshop' do
    autoshop = Autoshop.create!(name: 'Heavy Metal Reg')

    visit '/autoshops'

    expect(page).to have_content('Heavy Metal Reg')

    click_button 'Edit'

    visit "/autoshops/#{autoshop.id}/edit"

    fill_in 'name', with: 'Heavy Metal Repair Shop'
    click_button 'Update Auto Shop'

    expect(current_path).to eq("/autoshops")
    expect(page).to have_content('Heavy Metal Repair Shop')
  end
end
