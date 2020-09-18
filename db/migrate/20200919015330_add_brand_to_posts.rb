class AddBrandToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :brand, :integer
  end
end
