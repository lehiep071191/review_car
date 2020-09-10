class CreateCarRegistrateds < ActiveRecord::Migration[6.0]
  def change
    create_table :car_registrateds do |t|
      t.integer :car_id, foreign_key: true
      t.string :registrated_id, foreign_key: true
      t.timestamps
    end
  end
end
