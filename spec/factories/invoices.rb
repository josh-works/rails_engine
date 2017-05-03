FactoryGirl.define do
  factory :invoice do

    factory :invoice_with_invoice_items do
      invoice_items{create_list(:invoice_item, 3)}
      
    end

    customer
    merchant
    status "successful"
  end
end
