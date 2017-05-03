require 'rails_helper'

describe "find a random invoice" do
  it "can provide a single random invoice" do
      @invoice1, @invoice2, @invoice3 = create_list(:invoice, 3)

      get '/api/v1/invoices/random'

      expect(response).to be_success
      invoice = JSON.parse(response.body)
      expect(invoice["id"]).to eq(@invoice1.id) | eq(@invoice2.id) | eq(@invoice3.id)
      expect(invoice["merchant_id"]).to eq(@invoice1.merchant_id) | eq(@invoice2.merchant_id) | eq(@invoice3.merchant_id)
      expect(invoice["customer_id"]).to eq(@invoice1.customer_id) | eq(@invoice2.customer_id) | eq(@invoice3.customer_id)
      expect(invoice["status"]).to eq(@invoice1.status) | eq(@invoice2.status) | eq(@invoice3.status)
  end
end
