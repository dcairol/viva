json.array!(@reds) do |red|
  json.extract! red, :region_id, :fecha_nacimiento, :telefono, :direccion, :servicio, :condiciones
  json.url red_url(red, format: :json)
end
