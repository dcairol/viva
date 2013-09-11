class CreateDonantes < ActiveRecord::Migration
  def change
    create_table :donantes do |t|
      t.string :nombre
      t.string :telefono
      t.string :empresa
      t.integer :monto
      t.string :periocidad

      t.timestamps
    end
  end
end
