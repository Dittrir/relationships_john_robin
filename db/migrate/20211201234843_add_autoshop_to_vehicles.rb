class AddAutoshopToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :autoshop, foreign_key: true
  end
end
