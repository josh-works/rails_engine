json.(@invoices) do |invoice|
  json.(invoice, :id, :status, :customer_id, :merchant_id)
  # json.blah(invoice.merchant, :id, :name)
end
