require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'displays a parents page' do
    visit "/parents"
    expect(page).to have_content("Here are our parent records")
    expect(page).to have_link("Auto Shops")
    expect(page).to have_link("New Auto Shop")
    expect(page).to have_link("Vehicles")
    expect(page).to have_link("Add A Vehicle")
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

  it 'allows the viewer to visit the parent index page' do
    visit "/parents"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allows the viewer to visit the child index page' do
    visit "/parents"

    click_link('Go to Auto Shops')
    expect(current_path).to eq('/autoshops')
  end

  it 'allow the user to add auto shops' do
    visit "/parents"

    click_link('New Auto Shop')
    expect(current_path).to eq('/autoshops/new')
  end

  it 'allow the user to add vehicles' do
    visit "/parents"

    click_link('Add A Vehicle')
    expect(current_path).to eq('/vehicles/new')
  end
end
