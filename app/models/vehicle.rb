class Vehicle < ApplicationRecord
  belongs_to :autoshop

  def self.only_true_records
    Vehicle.where(need_repair: true)
  end

  def self.order_by_name
    Vehicle.order(name: :asc)
  end
end
