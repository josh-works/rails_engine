require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "is valid with name, description, and unit price" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
  end
  describe "relationships" do
    it "has belongs to a merchant" do
      should belong_to(:merchant)
    end
    it "has many invoice items" do
      should have_many(:invoice_items)
    end
    it "has many invoices" do
      should have_many(:invoices).through(:invoice_items)
    end
  end
end
