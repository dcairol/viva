json.array!(@ninos) do |nino|
  json.extract! nino, :nombre, :fecha_nacimiento, :edad, :sexo, :fecha_ingreso, :fecha_egreso, :motivo_ingreso, :motivo_egreso, :fecha_vencimiento_medida, :oficina_id, :familia_id, :tipo_acogimiento, :iglesia_id
  json.url nino_url(nino, format: :json)
end
