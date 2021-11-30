require 'rails_helper' 

RSpec.describe 'parents index page' do 
  it 'displays a parents page' do 
    visit "/parents"
    expect(page).to have_content("Available Shops")
    expect(page).to have_link("AutoShop")
    expect(page).to have_link("PlumberShop")
  end

  it 'can click PlumberShop link' do 
    visit "/parents" 
    expect(page).to have_link("PlumberShop")
    click_link "PlumberShop"
    expect(page).to have_current_path("/parents/:id")
  end
end