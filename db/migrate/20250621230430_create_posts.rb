class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :likes
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
