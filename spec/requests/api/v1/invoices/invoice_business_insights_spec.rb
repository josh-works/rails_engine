require 'rails_helper'

describe "invoice business intel endpoints" do

  it "returns collection of associated transactions" do
    invoice = create(:invoice_with_transactions)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(2)

    expect(transactions.first["id"]).to eq(1)
    expect(transactions.first["invoice_id"]).to eq(invoice.id)
    expect(transactions.first["result"]).to eq("success")
  end

  it "returns collection of invoice_items" do
    invoice = create(:invoices_with_items)
    invoice_item_1 = invoice.invoice_items.first

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first["item_id"]).to eq(invoice_item_1.item_id)
    expect(invoice_items.first["unit_price"]).to eq(invoice_item_1.unit_price)
  end

  xit " does thing " do
  end

  xit " does thing " do
  end

  xit " does thing " do
  end

end
