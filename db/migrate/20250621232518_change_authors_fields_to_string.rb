class ChangeAuthorsFieldsToString < ActiveRecord::Migration[8.0]
  def change
    change_column :authors, :name, :string
    change_column :authors, :email, :string
    change_column :authors, :password_hash, :string
  end
end
