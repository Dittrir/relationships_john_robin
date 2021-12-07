class Vehicle < ApplicationRecord
  belongs_to :autoshop

  def self.only_true_records
    Vehicle.where(need_repair: true)
  end
end
