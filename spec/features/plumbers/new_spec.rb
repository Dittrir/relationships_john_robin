require 'rails_helper'

RSpec.describe 'create new plumbers' do
  it 'can click the create a new plumber link' do 
    visit '/plumbers' 

    click_link 'New Plumber' 

    expect(current_path).to eq('/plumbershops/:id/plumbers/new')
  end

  it 'can create a plumber' do 
    visit '/plumbershops/:id/plumbers/new'

    fill_in('name', with: 'Jimmy')
    fill_in('license', with: "Residential")
    check 'on_call'
    fill_in('years_experience', with: 5)

    click_button("Create Plumber")

    expect(current_path).to eq('/plumbers')
    expect(page).to have_content('Jimmy')
  end
end