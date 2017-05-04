FactoryGirl.define do
  factory :customer do
    HPFaker = HarryPotterFaker.new()

    sequence :first_name do |n|
      HPFaker.first_name
    end
    sequence :last_name do |n|
      HPFaker.last_name
    end

    factory :customer_with_many_invoices do
      invoices {create_list(:invoice_with_transactions, 3)}
    end
  end
end
