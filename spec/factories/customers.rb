FactoryGirl.define do
  factory :customer do
    HPFaker = HarryPotterFaker.new()

    sequence :first_name do |n|
      HPFaker.first_name
    end
    sequence :last_name do |n|
      HPFaker.last_name
    end
  end
end
