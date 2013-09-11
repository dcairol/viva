class CreateIglesias < ActiveRecord::Migration
  def change
    create_table :iglesias do |t|
      t.string :nombre
      t.string :pastor
      t.text :coordinadores
      t.text :direccion
      t.text :compromiso_economico
      t.integer :region_id
      t.string :contacto_administrativo
      t.string :telefono
      t.string :correos

      t.timestamps
    end
  end
end
