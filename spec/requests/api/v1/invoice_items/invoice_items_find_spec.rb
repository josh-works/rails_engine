require 'rails_helper'

describe "find an invoice_item with params" do
  context "search using valid params" do
    before :each do
      @invoice_item = create(:invoice_item)
    end
    it "can find an invoice_item with id params" do
      get '/api/v1/invoice_items/find', params: {id: @invoice_item.id}
    end
    it "can find an invoice_item with item id params" do
      get '/api/v1/invoice_items/find', params: {item_id: @invoice_item.item_id}
    end
    it "can find an invoice_item with invoice id params" do
      get '/api/v1/invoice_items/find', params: {invoice_id: @invoice_item.invoice_id}
    end
    it "can find an invoice_item with quantity param" do
      get '/api/v1/invoice_items/find', params: {quantity: @invoice_item.quantity}
    end
    it "can find an invoice_item with status param" do
      price = @invoice_item.format_unit_price
      get '/api/v1/invoice_items/find', params: {unit_price: price}
    end
    it "can find an invoice_item with created_at param" do
      @invoice_item.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/invoice_items/find', params: {created_at: @invoice_item.created_at}
    end
    it "can find an invoice_item with updated_at param" do
      @invoice_item.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/invoice_items/find', params: {updated_at: @invoice_item.updated_at}
    end
    after :each do
      expect(response).to be_success
      invoice_item = JSON.parse(response.body)
      expect(invoice_item["id"]).to eq(@invoice_item.id)
      expect(invoice_item["item_id"]).to eq(@invoice_item.item_id)
      expect(invoice_item["invoice_id"]).to eq(@invoice_item.invoice_id)
      expect(invoice_item["quantity"]).to eq(@invoice_item.quantity)
      expect(invoice_item["unit_price"]).to eq(@invoice_item.unit_price)
    end
  end
end
