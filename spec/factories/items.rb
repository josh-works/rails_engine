FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      Faker::HarryPotter.character + " #{n}"
    end
    sequence :description  do |n|
      Faker::RuPaul.quote
    end
    sequence :unit_price do |n|
      1000 * n
    end
    factory :item_with_invoice_items do
      invoice_items {create_list(:invoice_item, 2)}
    end
    merchant
  end
end
