class CreatePlumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :plumbers do |t|
      t.string :name
      t.boolean :on_call
      t.integer :age
      t.string :license

      t.timestamps
    end
  end
end
