json.(@invoice_item, :id, :item_id, :invoice_id, :quantity)
json.unit_price(@invoice_item.format_unit_price)
