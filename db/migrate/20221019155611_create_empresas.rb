class CreateEmpresas < ActiveRecord::Migration[7.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.string :telefone
      t.string :email
      t.string :subdomain
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
