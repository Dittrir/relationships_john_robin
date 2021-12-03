require 'rails_helper'

RSpec.describe Autoshop do
  it {should have_many :vehicles}

  describe 'instance methods' do
    describe '#sort_created_at' do
      before(:each) do
        @shop_1 = Autoshop.create!(id: 1, name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
        @shop_3 = Autoshop.create!(id: 2, name: "Heavy Metal Repair", open: true, vehicles_in_shop: 5)
        @shop_2 = Autoshop.create!(id: 3, name: "Grease Monkeys Auto Shop", open: true, vehicles_in_shop: 2)
      end

      it 'returns the autoshops by most recently created'
        # expect() #DONT KNOW WHAT TO DO HERE
      # end
    end
  end
end
