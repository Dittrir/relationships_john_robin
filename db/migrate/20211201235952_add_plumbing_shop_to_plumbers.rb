class AddPlumbingShopToPlumbers < ActiveRecord::Migration[5.2]
  def change
    add_reference :plumbers, :plumbing_shop, foreign_key: true
  end
end
