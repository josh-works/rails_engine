require 'rails_helper'

describe "find a random invoice_item" do
  it "can provide a single random invoice_item" do
      @invoice_item_1, @invoice_item_2, @invoice_item_3 = create_list(:invoice_item, 3)

      get '/api/v1/invoice_items/random'

      expect(response).to be_success
      invoice = JSON.parse(response.body)
      expect(invoice["id"]).to eq(@invoice_item_1.id) | eq(@invoice_item_2.id) | eq(@invoice_item_3.id)
      expect(invoice["item_id"]).to eq(@invoice_item_1.item_id) | eq(@invoice_item_2.item_id) | eq(@invoice_item_3.item_id)
      expect(invoice["invoice_id"]).to eq(@invoice_item_1.invoice_id) | eq(@invoice_item_2.invoice_id) | eq(@invoice_item_3.invoice_id)
      expect(invoice["quantity"]).to eq(@invoice_item_1.quantity) | eq(@invoice_item_2.quantity) | eq(@invoice_item_3.quantity)
      expect(invoice["unit_price"]).to eq(@invoice_item_1.unit_price) | eq(@invoice_item_2.unit_price) | eq(@invoice_item_3.unit_price)
  end
end
