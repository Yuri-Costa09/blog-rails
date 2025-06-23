class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :password_hash

      t.timestamps
    end
  end
end
