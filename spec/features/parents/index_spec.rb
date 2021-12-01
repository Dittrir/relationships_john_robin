require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'displays a parents page' do
    visit "/parents"
    expect(page).to have_content("Here are our parent records")
    expect(page).to have_link("Auto Shops")
    expect(page).to have_link("Vehicles")
    expect(page).to have_link("Plumbing Shops")
    expect(page).to have_link("Plumbers")
  end

  it 'allow the user to add records' do
    visit "/parents"
    expect(page).to have_link("Add")
  end
end
