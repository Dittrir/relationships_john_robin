require 'rails_helper'


RSpec.describe 'welcome index page' do
  it 'displays a welcome page' do
    visit "/"
    expect(page).to have_content("Welcome to Robin and John's Website!")
    expect(page).to have_content("What would you like to do?")
    expect(page).to have_link("Check out our parent files!")
  end

  it 'can click shops index link' do 
    visit "/"
    expect(page).to have_link("Check out our parent files!")
    click_link "Check out our parent files!"
    expect(page).to have_current_path("/parents")
  end
end
