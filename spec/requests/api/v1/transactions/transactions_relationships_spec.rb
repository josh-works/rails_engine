# GET /api/v1/transactions/:id/invoice returns the associated invoice

require 'rails_helper'

describe "transaction relationship endpoint" do
  it "returns collection of associated invoice" do
    transaction = create(:transaction)
    id = transaction.id
    invoice1 = transaction.invoice

    get "/api/v1/transactions/#{id}/invoice"

    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
    expect(invoice["merchant_id"]).to eq(invoice1.merchant_id)
    expect(invoice["customer_id"]).to eq(invoice1.customer_id)
    expect(invoice["status"]).to eq(invoice1.status)
  end
end
