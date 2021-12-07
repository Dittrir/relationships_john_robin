#spec/features/autoshops/edit_spec.rb
require 'rails_helper'

RSpec.describe 'the autoshop edit' do
  before(:each) do
    @autoshop = Autoshop.create!(name: "Heavy Metal Auto Repair", open: true, vehicles_in_shop: 8)
  end
  it 'allows the user to return to the main page' do
    visit '/autoshops'

    expect(page).to have_content("Back to Main")
  end

  it 'links to the edit page' do
    visit '/autoshops'

    click_button "Edit #{@autoshop.name}"

    expect(current_path).to eq("/autoshops/#{@autoshop.id}/edit")
  end

  it 'can edit the autoshop' do
    wrong_autoshop = Autoshop.create!(name: 'Heavy Metal Reg', open: true, vehicles_in_shop: 8)
    visit '/autoshops'

    expect(page).to have_content('Heavy Metal Reg')

    click_button "Edit #{wrong_autoshop.name}"

    fill_in('Name', with: 'Heavy Metal Repair Shop')
    check "Open" #<<<<<
    fill_in('Vehicles in shop', with: 14) #<<<<
    click_button('Update Auto Shop')

    expect(current_path).to eq("/autoshops/#{wrong_autoshop.id}")
    expect(page).to have_content('Heavy Metal Repair Shop')
    #Test expectations of new form additions Open and 14
  end
end
