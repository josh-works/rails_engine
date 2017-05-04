require 'rails_helper'

describe "customer relationship endpoints" do
  before :each do
    @customer = create(:customer_with_many_invoices)
    @id = @customer.id
  end
  it "returns a collection of associated invoices" do
    invoice1 = @customer.invoices.first

    get "/api/v1/customers/#{@id}/invoices"

    expect(response).to be_success
    invoices = JSON.parse(response.body)
    invoice = invoices.first
    expect(invoices.count).to eq(3)
    expect(invoice["id"]).to eq(invoice1.id)
    expect(invoice["customer_id"]).to eq(invoice1.customer_id)
    expect(invoice["status"]).to eq(invoice1.status)
  end
  it "returns a collection of associated transactions" do
    transaction1 = @customer.invoices.first.transactions.first

    get "/api/v1/customers/#{@id}/transactions"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    transaction = transactions.first
    expect(transactions.count).to eq(6)
    expect(transaction["id"]).to eq(transaction1.id)
    expect(transaction["invoice_id"]).to eq(transaction1.invoice_id)
    expect(transaction["credit_card_number"]).to eq(transaction1.credit_card_number)
    expect(transaction["result"]).to eq(transaction1.result)
  end
end
