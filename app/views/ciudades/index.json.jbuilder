json.array!(@ciudades) do |ciudad|
  json.extract! ciudad, :id, :nombre, :cod_dane, :departamento_id
  json.url ciudad_url(ciudad, format: :json)
end
