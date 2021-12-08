class CreatePlumbershops < ActiveRecord::Migration[5.2]
  def change
    create_table :plumbershops do |t|
      t.string :name
      t.boolean :service_offered
      t.integer :fleet_vehicles

      t.timestamps
    end
  end
end
