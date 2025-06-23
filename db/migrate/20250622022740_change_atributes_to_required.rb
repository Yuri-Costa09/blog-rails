class ChangeAtributesToRequired < ActiveRecord::Migration[8.0]
  def change
    change_column_null :authors, :name, false
    change_column_null :authors, :email, false
    remove_column :authors, :password_hash, :string
  end
end
