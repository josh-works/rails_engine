FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "successful"
    factory :invoices_with_items do
      #lauren's factory
      invoice_items {create_list(:invoice_item, 2)}
      transactions {create_list(:transaction, 2)}

    end
    factory :invoice_with_transactions do
      transactions {create_list(:transaction, 2)}
    end
  end
end
