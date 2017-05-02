json.(@invoices) do |invoice|
  json.(invoice, :id, :status)
  # json.blah(invoice.merchant, :id, :name)
end
