class CreateAutoshops < ActiveRecord::Migration[5.2]
  def change
    create_table :auto_shops do |t|
      t.string :name
      t.boolean :open
      t.integer :vehicles_in_shop

      t.timestamps
    end
  end
end
