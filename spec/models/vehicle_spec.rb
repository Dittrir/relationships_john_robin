#spec/models/vehicle_spec.rb
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it {should belong_to :autoshop}
  describe 'instance methods' do
    describe '#only_true_records' do
      before(:each) do
        @shop_1 = Autoshop.create!(name: "Billy Bobs Repair Shop", open: true, vehicles_in_shop: 3)
        @vehicle_1 = Vehicle.create!(name: 'Chevy Silverado 3500', need_repair: true, repair_cost: 3500, autoshop_id: @shop_1.id)
        @vehicle_2 = Vehicle.create!(name: 'Mercedes Sprinter', need_repair: true, repair_cost: 800, autoshop_id: @shop_1.id)
        @vehicle_3 = Vehicle.create!(name: 'Kawasaki KLR 650', need_repair: false, repair_cost: 0, autoshop_id: @shop_1.id)
      end

      it 'returns the only_true_records' do
        expect(@shop_1.vehicles.only_true_records).to eq([@vehicle_1, @vehicle_2])
      end
    end
  end
end
