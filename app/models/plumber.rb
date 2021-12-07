class Plumber < ApplicationRecord
  belongs_to :plumbershop

  def self.on_call?
    where(on_call: :true)
  end
end