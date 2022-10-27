class CreateGrupos < ActiveRecord::Migration[7.0]
  def change
    create_table :grupos do |t|
      t.string :nome_grupo
      t.text :descricao
      t.integer :position

      t.timestamps
    end
  end
end
