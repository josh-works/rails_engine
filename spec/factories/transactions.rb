FactoryGirl.define do
  factory :transaction do
    invoice
    sequence :credit_card_number do |n|
      "12345777#{n}"
    end
    credit_card_expiration_date ""
    result "success"
  end
end
