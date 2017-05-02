require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "is valid with merchant, customer, and status" do
    it { should validate_presence_of(:status) }
  end
  describe "relationships" do
    it "belongs to a merchant" do
      should belong_to(:merchant)
    end
    it "belongs to a customer" do
      should belong_to(:customer)
    end
  end
end
