class Autoshop < ApplicationRecord
  has_many :vehicles

  def self.sort_created_at
    Autoshop.all.order(:created_at)
  end
end
