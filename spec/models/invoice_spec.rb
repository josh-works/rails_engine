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
    it "has many invoice items" do
      should have_many(:invoice_items)
    end
    it "has many items" do
      should have_many(:items).through(:invoice_items)
    end
  end

  it "#order_total" do
    invoice_1 = create(:invoice_with_invoice_items)

    expect(invoice_1.order_total).to eq(3000)
  end

end
