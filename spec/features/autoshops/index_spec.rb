require 'rails_helper'

RSpec.describe 'autoshops index page' do
  it 'displays the autoshops page' do
    visit "/autoshops"
    expect(page).to have_content("Auto Shops")
    expect(page).to have_link("Add New Autoshop")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Remove")
  end
end
