json.(@items) do |item|
  json.(item, :id, :name, :description, :unit_price)
end
