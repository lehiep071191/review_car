class CreateSubcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :subcomments do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
