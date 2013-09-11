json.array!(@iglesia) do |iglesia|
  json.extract! iglesia, :pastor, :coordinadores, :direccion, :compromiso_economico, :region_id, :contacto_administrativo, :telefono, :correos
  json.url iglesia_url(iglesia, format: :json)
end
