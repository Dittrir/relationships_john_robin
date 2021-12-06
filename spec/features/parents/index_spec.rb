#parents/index_spec.rb
require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'displays a parents page' do
    visit "/parents"
    expect(page).to have_content("Here are our parent records")
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
