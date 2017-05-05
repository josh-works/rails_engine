json.(@items) do |item|
  json.(item, :id, :name, :description)
end
