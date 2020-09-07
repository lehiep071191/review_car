class CreateRegistrateds < ActiveRecord::Migration[6.0]
  def change
    create_table :registrateds do |t|
      t.date :time_registrated
      t.string :place

      t.timestamps
    end
  end
end
