require 'rails_helper'

RSpec.describe 'parents index page' do
  it 'can click shops index link' do 
    visit "/"
    
    click_link "Let's get started!"
    expect(page).to have_current_path("/parents")
  end
end
