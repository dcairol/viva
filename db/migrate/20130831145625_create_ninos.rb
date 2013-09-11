class CreateNinos < ActiveRecord::Migration
  def change
    create_table :ninos do |t|
      t.string :nombre
      t.date :fecha_nacimiento
      t.integer :edad
      t.string :sexo
      t.date :fecha_ingreso
      t.date :fecha_egreso
      t.text :motivo_ingreso
      t.text :motivo_egreso
      t.date :fecha_vencimiento_medida
      t.integer :oficina_id
      t.integer :familia_id
      t.string :tipo_acogimiento
      t.integer :iglesia_id

      t.timestamps
    end
  end
end
