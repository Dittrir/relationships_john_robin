#spec/features/autoshops/destroy_spec.rb.rb
require 'rails_helper'

RSpec.describe 'destroying an auto shop' do
  it 'can delete the auto shop from the index page' do
    autoshop = Autoshop.create!(name: 'Sad Car Repair')

    visit '/autoshops'

    click_button 'Delete'

    expect(current_path).to eq('/autoshops')
    expect(page).to_not have_content('Sad Car Repair')
  end
end
