class AddPlumbershopToPlumbers < ActiveRecord::Migration[5.2]
  def change
    add_reference :plumbers, :plumbershop, foreign_key: true
  end
end
