json.(@customer, :id, :first_name, :last_name)
json.total_transactions(@customer.transactions.count)
