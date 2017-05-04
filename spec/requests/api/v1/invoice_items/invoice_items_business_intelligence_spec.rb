require 'rails_helper'

describe "invoice_item business intel endpoints" do

  it "returns associated item" do
    invoice_item = create(:invoice_item)
    item_1 = invoice_item.item

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["name"]).to eq(item_1.name)
  end

  it "returns associated invoice" do

    invoice_item = create(:invoice_item)
    invoice_1 = invoice_item.invoice

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["customer_id"]).to eq(invoice_1.customer_id)
  end

end
