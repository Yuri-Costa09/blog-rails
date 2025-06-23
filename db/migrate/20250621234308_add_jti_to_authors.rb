class AddJtiToAuthors < ActiveRecord::Migration[8.0]
  def change
    add_column :authors, :jti, :string, null: false
    add_index :authors, :jti, unique: true
  end
end
