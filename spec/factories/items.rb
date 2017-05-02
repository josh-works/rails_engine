FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      Faker::HarryPotter.character + " #{n}"
    end
    sequence :description  do |n|
      Faker::RuPaul.quote
    end
    unit_price 1000
    merchant
  end
end
