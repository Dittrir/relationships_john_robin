class CreatePlumbingShops < ActiveRecord::Migration[5.2]
  def change
    create_table :plumbing_shops do |t|
      t.string :name
      t.boolean :service_offered
      t.boolean :construction_offered
      t.integer :fleet_vehicles

      t.timestamps
    end
  end
end
