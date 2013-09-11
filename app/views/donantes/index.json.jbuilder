json.array!(@donantes) do |donante|
  json.extract! donante, :nombre, :telefono, :empresa, :monto, :periocidad
  json.url donante_url(donante, format: :json)
end
