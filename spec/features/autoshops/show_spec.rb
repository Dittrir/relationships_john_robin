require 'rails_helper'

RSpec.describe "Autoshops Show Page", type: :feature do
  before(:each) do
    @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
  end

  it 'displays the auto shop name' do

    visit "/autoshops/#{@shop_1.id}"

    expect(page).to have_content(@shop_1.name)
  end

  it 'allows the user to return to the main page' do

    visit "/autoshops/#{@shop_1.id}"

    expect(page).to have_content("Back to Main Directory")
    expect(page).to have_content("Back to Auto Shop Directory")
  end
end
