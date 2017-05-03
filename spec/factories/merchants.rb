FactoryGirl.define do

  factory :merchant do
    sequence :name do
      Faker::Superhero.name
    end
  end

end
