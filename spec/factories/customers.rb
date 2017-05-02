FactoryGirl.define do
  factory :customer do
    HPFaker = HarryPotterFaker.new()

    sequence :first_name do |n|
      HPFaker.first_name
    end
    sequence :last_name do |n|
      HPFaker.last_name
    end
    cust_created_at "2017-05-01 19:57:02"
    cust_updated_at "2017-05-01 19:57:02"
  end
end
