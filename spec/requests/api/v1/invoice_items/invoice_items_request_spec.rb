require 'rails_helper'

describe "Invoice Items API" do
  it "sends a list of invoice items" do
    invoice_item_list = create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(invoice_items.count).to eq(3)
    expect(invoice_item["id"]).to eq(invoice_item_list.first.id)
    expect(invoice_item["quantity"]).to eq(invoice_item_list.first.quantity)
    expect(invoice_item["unit_price"]).to eq(invoice_item_list.first.unit_price)
  end
  it "can get one invoice item by id" do
    invoice_item_1 = create(:invoice_item)
    id = invoice_item_1.id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
    expect(invoice_item["quantity"]).to eq(invoice_item_1.quantity)
    expect(invoice_item["unit_price"]).to eq(invoice_item_1.format_unit_price)
  end
end
