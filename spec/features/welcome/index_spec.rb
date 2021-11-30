require 'rails_helper'

RSpec.describe 'welcome index page' do
  it 'displays a welcome page' do
    visit "/welcome"
  end
end
