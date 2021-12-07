require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'displays parents pages' do
    visit "/"
    expect(page).to have_content("Welcome to Robin and John's Website!")
    expect(page).to have_link("Let's get started!")
  end
end
