require 'rails_helper'

RSpec.describe 'plumbers show page' do
  before(:each) do
    @plumber_1 = Plumber.create!(
      name: "Frank", license: "Journeyman", on_call: false, years_experience: 6
      )
    @plumber_2 = Plumber.create!(
      name: "Zelma", license: "Master", on_call: true, years_experience: 10
      )
    @plumber_3 = Plumber.create!(
      name: "Chuck", license: "Journeyman", on_call: false, years_experience: 30
      )
  end

  it 'displays all plumbers' do 
    visit "/plumbers"
    expect(page).to have_content(@plumber_1.name)
    expect(page).to have_content(@plumber_2.name)
    expect(page).to have_content(@plumber_3.name)
  end
end