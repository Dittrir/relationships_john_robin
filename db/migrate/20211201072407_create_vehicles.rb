class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :shop_id
      t.string :name
      t.boolean :need_repair
      t.integer :repair_cost
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
