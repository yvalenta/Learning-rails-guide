json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :nombre, :ciudad_id
  json.url empresa_url(empresa, format: :json)
end
