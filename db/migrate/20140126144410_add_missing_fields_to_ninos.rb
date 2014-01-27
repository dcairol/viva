class AddMissingFieldsToNinos < ActiveRecord::Migration
  def change
    add_column :ninos,:cedula,:string
    add_column :ninos,:grupo_hermanos,:boolean
    add_column :ninos,:numero_hermanos,:integer
    add_column :ninos,:subvencionado,:boolean
    add_column :ninos,:discapacidad,:boolean
    add_column :ninos,:referencia,:string
    add_column :ninos,:medida_proteccion,:string
    add_column :ninos,:situacion_legal,:string
    add_column :ninos,:codigo_alternativa,:string
    add_column :ninos,:subsidio_aprobado,:integer
    add_column :ninos,:fecha_medida_proteccion,:date
    add_column :ninos,:ayudas_instituciones,:string
    add_column :ninos,:tipo_discapacidad,:string
    add_column :ninos,:causa_permanencia,:string
    add_column :ninos,:escolaridad,:string
    add_column :ninos,:servicio_apoyo,:string
    add_column :ninos,:causa_egreso,:string
  end
end
