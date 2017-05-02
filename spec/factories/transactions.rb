FactoryGirl.define do
  factory :transaction do
    invoice
    sequence :credit_card_number do |n|
      "12345777#{n}"
    end
    credit_card_expiration_date ""
    result 1
    trans_created_at "2017-05-01 19:28:00"
    trans_updated_at "2017-05-01 19:28:00"
  end
end
