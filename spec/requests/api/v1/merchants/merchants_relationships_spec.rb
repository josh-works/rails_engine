require 'rails_helper'

describe "merchant relationship endpoints" do
  before :each do
    @merchant = create(:merchant_with_invoices_and_items)
    @id = @merchant.id
    @merchant.invoices.each {|invoice| invoice.items.each { |item| item.update(merchant_id: @id)}}
  end
  it "returns collection of items associated with merchant" do
    item1 = @merchant.invoices.first.items.first

    get "/api/v1/merchants/#{@id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = items.first
    expect(items.count).to eq(6)
    expect(item["id"]).to eq(item1.id)
    expect(item["name"]).to eq(item1.name)
    expect(item["description"]).to eq(item1.description)
  end
  it "returns collection of invoices associated with merchant" do
    invoice1 = @merchant.invoices.first

    get "/api/v1/merchants/#{@id}/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)
    invoice = invoices.first
    expect(invoices.count).to eq(3)
    expect(invoice["id"]).to eq(invoice1.id)
    expect(invoice["customer_id"]).to eq(invoice1.customer_id)
    expect(invoice["status"]).to eq(invoice1.status)
  end
end
