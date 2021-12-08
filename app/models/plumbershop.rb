class Plumbershop < ApplicationRecord
  has_many :plumbers, dependent: :destroy

  def plumber_count
    Plumber.where(plumbershop_id: self.id).count
  end
end