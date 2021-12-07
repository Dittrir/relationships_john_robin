class Plumbershop < ApplicationRecord
  has_many :plumbers

  # def sorted_by_most_recetly_created 
  #   Plumbershop.order(created_at: :desc)
  # end

  def plumber_count
    Plumber.where(plumbershop_id: self.id).count
  end
end