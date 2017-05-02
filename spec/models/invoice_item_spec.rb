require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "is valid with quantity and unit price" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
  end
  describe "relationships" do
    it "belongs to an item" do
      should belong_to(:item)
    end
    it "belongs to an invoice" do
      should belong_to(:invoice)
    end
  end
end
