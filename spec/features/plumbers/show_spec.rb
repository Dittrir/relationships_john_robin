require 'rails_helper'

RSpec.describe '' do
  before(:each) do
    @plumber_1 = Plumber.create!(
      name: "Frank", license: "Journeyman", on_call: false, years_experience: 6
      )
    @plumber_2 = Plumber.create!(
      name: "Zelma", license: "Master", on_call: true, years_experience: 10
      )
    @plumber_3 = Plumber.create!(
      name: "Mazzy", license: "Journeyman", on_call: false, years_experience: 12
      )
  end

  it 'displays a single plumber with attributes' do 
    visit "/plumbers/#{@plumber_2.id}"
    expect(page).to have_content(@plumber_2.id)
    expect(page).to have_content(@plumber_2.name)
    expect(page).to have_content(@plumber_2.license)
    expect(page).to have_content(@plumber_2.on_call)
    expect(page).to have_content(@plumber_2.years_experience)
    expect(page).to have_content(@plumber_2.created_at)
    expect(page).to have_content(@plumber_2.updated_at)
    expect(page).to_not have_content(@plumber_1.name)
    expect(page).to_not have_content(@plumber_3.name)
  end
end