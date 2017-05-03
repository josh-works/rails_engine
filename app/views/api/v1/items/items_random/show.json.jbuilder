json.(@item, :id, :name, :description, :merchant_id)
json.unit_price(@item.format_unit_price)
