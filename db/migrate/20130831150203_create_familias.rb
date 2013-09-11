class CreateFamilias < ActiveRecord::Migration
  def change
    create_table :familias do |t|
      t.string :nombre
      t.string :grupo
      t.text :telefonos
      t.string :correo
      t.text :direccion
      t.string :aval
      t.integer :iglesia_id
      t.string :tipo_acogimiento
      t.text :perfil

      t.timestamps
    end
  end
end
