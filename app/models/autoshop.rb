class Autoshop < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  def self.sort_created_at
    Autoshop.all.order(:created_at)
  end

  def associated_children_count
    Vehicle.where(autoshop_id: self.id).count
  end
end
