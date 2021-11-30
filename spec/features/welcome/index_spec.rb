require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'displays parents pages' do
    visit "/parents"
    expect(page).to have_link("AutoShop")
    expect(page).to have_link("PlumberShop")
  end
end
