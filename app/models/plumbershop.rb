class Plumbershop < ApplicationRecord
  has_many :plumbers

  # def sorted_by_most_recetly_created 
  #   Plumbershop.order(created_at: :desc)
  # end
end