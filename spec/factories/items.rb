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
    merchant
  end
end
