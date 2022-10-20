class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :sobrenome
      t.string :genero
      t.string :telefone
      t.string :email
      t.string :celular
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :estado_civil
      t.string :grau_parentesco
      t.date :data_nascimento
      t.date :data_falecimento
      t.date :data_batismo
      t.text :bio
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
