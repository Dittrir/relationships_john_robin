#spec/models/autoshop_spec.rb
require 'rails_helper'

RSpec.describe Autoshop do
  it {should have_many :vehicles}

  describe 'instance methods' do
    describe '#sort_created_at' do
      before(:each) do
        @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
        @shop_3 = Autoshop.create!(name: "Heavy Metal Repair", open: true, vehicles_in_shop: 5)
        @shop_2 = Autoshop.create!(name: "Grease Monkeys Auto Shop", open: true, vehicles_in_shop: 2)
      end

      it 'returns the autoshops by most recently created' do
        expect(Autoshop.sort_created_at).to eq([@shop_1, @shop_3, @shop_2])
      end
    end

    describe '#associated_children_count' do
      before(:each) do
        @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
        @vehicle_1 = @shop_1.vehicles.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
        @vehicle_2 = @shop_1.vehicles.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
        @vehicle_3 = @shop_1.vehicles.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
      end

      it 'returns the count of associated child classes' do
        expect(@shop_1.associated_children_count).to eq(3)
      end
    end
  end
end
