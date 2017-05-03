require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "is valid with name" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:customers).through(:invoices) }
  end

  describe "reporting" do
    it "#total_revenue" do
      merchant = create(:merchant_with_invoices)

      expect(merchant.total_revenue).to eq(12000)
    end
  end

end
