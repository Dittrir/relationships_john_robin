require 'rails_helper'

RSpec.describe "Autoshops Show Page", type: :feature do
  it 'displays the auto shop name' do
    shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)

    visit "/autoshops/#{shop_1.id}"

    expect(page).to have_content(shop_1.name)
  end
end
