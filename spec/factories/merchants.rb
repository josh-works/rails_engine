FactoryGirl.define do
  factory :merchant do
    sequence :name do
      Faker::Superhero.name
    end
    factory :merchant_with_invoices_and_items do
      # lauren's factories:
      invoices {create_list(:invoices_with_items, 3)}
    end
    factory :merchant_with_transactions do
      invoices {create_list(:invoice_with_transactions, 3)}
    end
  end
end
