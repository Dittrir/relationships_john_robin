class Plumber < ApplicationRecord
  belongs_to :plumbershop

  def self.on_call?
    where(on_call: :true)
  end

  def self.aplhabetical_order
    order(:name)
  end

  def self.given_threshold(threshold)
    where("years_experience > ?", threshold)
  end
end