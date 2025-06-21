class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.text :name
      t.text :email
      t.text :password_hash

      t.timestamps
    end
  end
end
