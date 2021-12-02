require 'rails_helper' 

RSpec.describe 'parents index page' do 
  it 'displays a parents page' do 
    visit "/parents"
    expect(page).to have_content("Here are our parent records")
    expect(page).to have_link("Auto Shops")
    expect(page).to have_link("Add")
    expect(page).to have_link("Vehicles")
    expect(page).to have_link("Add")
    expect(page).to have_link("Plumber Shops")
    expect(page).to have_link("Add")
    expect(page).to have_link("Plumbers")
    expect(page).to have_link("Add")
  end
   
  it "click plumbershops link" do 
    visit "/parents"
    click_link "Plumber Shops"
    expect(page).to have_current_path("/plumbershops")
  end

  it "click plumbers link" do 
    visit "/parents"
    click_link "Plumbers"
    expect(page).to have_current_path("/plumbers")
  end
end