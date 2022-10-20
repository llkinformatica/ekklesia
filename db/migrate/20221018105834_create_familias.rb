class CreateFamilias < ActiveRecord::Migration[7.0]
  def change
    create_table :familias do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :identificador_familia
      t.boolean :mesmo_endereco

      t.timestamps
    end
  end
end
