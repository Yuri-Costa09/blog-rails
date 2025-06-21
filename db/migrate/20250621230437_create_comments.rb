class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :posts, null: false, foreign_key: true
      t.references :authors, null: false, foreign_key: true
      t.references :parent_comment, null: true, foreign_key: { to_table: :comments }
      t.text :content
      t.integer :likes

      t.timestamps
    end
  end
end
