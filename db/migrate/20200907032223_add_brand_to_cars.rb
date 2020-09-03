class AddBrandToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :brand, :string
  end
end
