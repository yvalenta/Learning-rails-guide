json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id, :nombre, :cod_dane
  json.url departamento_url(departamento, format: :json)
end
