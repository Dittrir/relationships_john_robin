class CreatePlumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :plumbers do |t|
      t.string :name
      t.string :license
      t.boolean :on_call
      t.integer :years_experience

      t.timestamps
    end
  end
end
