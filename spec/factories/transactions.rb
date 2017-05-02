FactoryGirl.define do
  factory :transaction do
    invoice_id 1
    credit_card_number "1234567890"
    credit_card_expiration_date ""
    result 1
    trans_created_at "2017-05-01 19:28:00"
    trans_updated_at "2017-05-01 19:28:00"
  end
end
