class AddFieldsToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :fullname, :string
    add_column :registrations, :drive_lisence, :integer
  end
end
