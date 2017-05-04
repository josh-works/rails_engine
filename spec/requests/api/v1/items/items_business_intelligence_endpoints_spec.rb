require 'rails_helper'

describe "item business intel endpoints" do

  it "returns collection of associated invoice items" do
    item = create(:item_with_invoice_items)
    invoice_items_1 = item.invoice_items.first

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first
    expect(invoice_item["quantity"]).to eq(invoice_items_1.quantity)
    expect(invoice_items.count).to eq(item.invoice_items.count)
  end

  it "returns associated merchant" do
    item = create(:item_with_invoice_items)
    merchant_1 = item.merchant

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq(merchant_1.name)
  end

end
