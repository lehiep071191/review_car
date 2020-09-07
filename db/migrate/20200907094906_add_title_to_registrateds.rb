class AddTitleToRegistrateds < ActiveRecord::Migration[6.0]
  def change
    add_column :registrateds, :title, :string
  end
end
