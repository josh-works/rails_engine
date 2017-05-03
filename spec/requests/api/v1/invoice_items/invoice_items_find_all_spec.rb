require 'rails_helper'

describe "find many invoice_item items with params" do
  context "search using valid params" do
    before :each do
      @invoice_item_1, @invoice_item_2, @invoice_item_3 = create_list(:invoice_item, 3)
    end
    it "can find an invoice_item with id params" do
      get '/api/v1/invoice_items/find_all', params: {id: @invoice_item_1.id}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first
      expect(invoice_items.count).to eq(1)
      expect(invoice_item["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item["item_id"]).to eq(@invoice_item_1.item_id)
      expect(invoice_item["invoice_id"]).to eq(@invoice_item_1.invoice_id)
      expect(invoice_item["quantity"]).to eq(@invoice_item_1.quantity)
      expect(invoice_item["unit_price"]).to eq(@invoice_item_1.unit_price)
    end
    it "can find an invoice_item with item_id params" do
      @invoice_item_1.update(item_id: 1)
      @invoice_item_2.update(item_id: 1)

      get '/api/v1/invoice_items/find_all', params: {item_id: @invoice_item_1.item_id}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item_1 = invoice_items.first
      invoice_item_2 = invoice_items.last
      expect(invoice_items.count).to eq(2)
      expect(invoice_item_1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_2.id)
    end
    it "can find an invoice_item with invoice id params" do
      @invoice_item_1.update(invoice_id: 1)
      @invoice_item_3.update(invoice_id: 1)

      get '/api/v1/invoice_items/find_all', params: {invoice_id: @invoice_item_1.invoice_id}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item_1 = invoice_items.first
      invoice_item_2 = invoice_items.last
      expect(invoice_items.count).to eq(2)
      expect(invoice_item_1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_3.id)
    end
    it "can find an invoice_item with quantity param" do
      get '/api/v1/invoice_items/find_all', params: {quantity: @invoice_item_2.quantity}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item_1 = invoice_items.first
      invoice_item_2 = invoice_items.last
      expect(invoice_items.count).to eq(3)
      expect(invoice_item_1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_3.id)
    end
    it "can find an item with unit price param" do
      price = @invoice_item_2.format_unit_price

      get '/api/v1/invoice_items/find_all', params: {unit_price: price}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      invoice_item_2 = items.last
      expect(items.count).to eq(3)
      expect(item1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_3.id)
    end
    it "can find an invoice_item with created_at param" do
      @invoice_item_1.update(created_at: "2012-03-27T14:54:03.000Z")
      @invoice_item_2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/invoice_items/find_all', params: {created_at: @invoice_item_1.created_at}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item_1 = invoice_items.first
      invoice_item_2 = invoice_items.last
      expect(invoice_items.count).to eq(2)
      expect(invoice_item_1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_2.id)
    end
    it "can find an invoice_item with updated_at param" do
      @invoice_item_1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @invoice_item_2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @invoice_item_3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/invoice_items/find_all', params: {updated_at: @invoice_item_1.updated_at}

      expect(response).to be_success
      invoice_items = JSON.parse(response.body)
      invoice_item_1 = invoice_items.first
      invoice_item_2 = invoice_items.last
      expect(invoice_items.count).to eq(3)
      expect(invoice_item_1["id"]).to eq(@invoice_item_1.id)
      expect(invoice_item_2["id"]).to eq(@invoice_item_3.id)
    end
  end
end
