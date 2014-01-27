class AddActivaToFamilias < ActiveRecord::Migration
  def change
    add_column :familias, :activa, :boolean
  end
end
