class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.string :telefono
      t.integer :telefoneable_id
      t.string :telefoneable_type

      t.timestamps
    end
  end
end
