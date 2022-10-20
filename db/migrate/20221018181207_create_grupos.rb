class CreateGrupos < ActiveRecord::Migration[7.0]
  def change
    create_table :grupos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
