class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sorted_by_most_recetly_created 
    order(created_at: :desc)
  end
end
