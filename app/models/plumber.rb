class Plumber < ApplicationRecord
  belongs_to :plumbershop

  def self.on_call?
    where(on_call: :true)
  end

  def self.aplhabetical_order
    order(:name)
  end
end