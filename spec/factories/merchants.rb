FactoryGirl.define do
  factory :merchant do

    factory :merchant_with_invoices do
      invoices{create_list(:invoice_with_invoice_items, 4)}
    end

    sequence :name do
      Faker::Superhero.name
    end
  end

end
