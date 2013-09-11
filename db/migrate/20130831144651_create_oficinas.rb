class CreateOficinas < ActiveRecord::Migration
  def change
    create_table :oficinas do |t|
      t.string :nombre
      t.text :direccion
      t.string :responsable

      t.timestamps
    end
  end
end
