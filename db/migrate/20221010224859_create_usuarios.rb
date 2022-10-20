class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :password_digest
      t.string :nome
      t.text :bio
      t.integer :grupo, null: false, default: 0, limit: 1 

      t.timestamps
    end
  end
end
