json.array!(@oficinas) do |oficina|
  json.extract! oficina, :nombre, :direccion, :responsable
  json.url oficina_url(oficina, format: :json)
end
