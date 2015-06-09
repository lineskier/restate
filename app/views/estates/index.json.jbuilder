json.array!(@estates) do |estate|
  json.extract! estate, :id, :title, :price, :type, :description, :address
  json.url estate_url(estate, format: :json)
end
