json.array!(@familia) do |familia|
  json.extract! familia, :nombre, :grupo, :telefonos, :correo, :direccion, :aval, :iglesia_id, :tipo_acogimiento, :perfil
  json.url familia_url(familia, format: :json)
end
