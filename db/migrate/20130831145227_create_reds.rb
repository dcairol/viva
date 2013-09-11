class CreateReds < ActiveRecord::Migration
  def change
    create_table :reds do |t|
      t.string :nombre
      t.integer :region_id
      t.date :fecha_nacimiento
      t.string :telefono
      t.text :direccion
      t.text :servicio
      t.text :condiciones

      t.timestamps
    end
  end
end
