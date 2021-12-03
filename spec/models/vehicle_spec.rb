require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it {should belong_to :autoshop}
end
