class CreateHastags < ActiveRecord::Migration[6.0]
  def change
    create_table :hastags do |t|
      t.string :content
      t.integer :post_id, foreign_key: true

      t.timestamps
    end
  end
end
