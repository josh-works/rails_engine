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

  it "returns a collection of associated items" do
    invoice = create(:invoices_with_items)
    item_1 = invoice.items.first
    item_3 = invoice.items.last

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success
    items = JSON.parse(response.body)

    expect(items.first["name"]).to eq(item_1.name)
    expect(items.last["name"]).to eq(item_3.name)
  end

  it "returns the associated customer" do
    invoice = create(:invoice_with_transactions)
    customer_1 = invoice.customer

    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(customer_1.first_name)
    expect(customer["id"]).to eq(customer_1.id)
  end

  it "returns the associated merchant" do
    invoice = create(:invoice_with_transactions)
    merchant_1 = invoice.merchant

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(merchant_1.name)
  end

end
