require 'rails_helper'

describe "find many invoices with params" do
  context "search using valid params" do
    before :each do
      @invoice1, @invoice2, @invoice3 = create_list(:invoice, 3)
    end
    it "can find an invoice with id params" do
      get '/api/v1/invoices/find_all', params: {id: @invoice1.id}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice = invoices.first
      expect(invoices.count).to eq(1)
      expect(invoice["id"]).to eq(@invoice1.id)
      expect(invoice["status"]).to eq(@invoice1.status)
      expect(invoice["merchant_id"]).to eq(@invoice1.merchant_id)
      expect(invoice["customer_id"]).to eq(@invoice1.customer_id)
    end
    it "can find an invoice with merchant_id params" do
      @invoice1.update(merchant_id: 1)
      @invoice2.update(merchant_id: 1)

      get '/api/v1/invoices/find_all', params: {merchant_id: @invoice1.merchant_id}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice1 = invoices.first
      invoice2 = invoices.last
      expect(invoices.count).to eq(2)
      expect(invoice1["id"]).to eq(@invoice1.id)
      expect(invoice2["id"]).to eq(@invoice2.id)
    end
    it "can find an invoice with customer id params" do
      @invoice1.update(customer_id: 1)
      @invoice3.update(customer_id: 1)

      get '/api/v1/invoices/find_all', params: {customer_id: @invoice1.customer_id}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice1 = invoices.first
      invoice2 = invoices.last
      expect(invoices.count).to eq(2)
      expect(invoice1["id"]).to eq(@invoice1.id)
      expect(invoice2["id"]).to eq(@invoice3.id)
    end
    it "can find an invoice with status param" do
      get '/api/v1/invoices/find_all', params: {status: @invoice2.status}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice1 = invoices.first
      invoice2 = invoices.last
      expect(invoices.count).to eq(3)
      expect(invoice1["id"]).to eq(@invoice1.id)
      expect(invoice2["id"]).to eq(@invoice3.id)
    end
    it "can find an invoice with created_at param" do
      @invoice1.update(created_at: "2012-03-27T14:54:03.000Z")
      @invoice2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/invoices/find_all', params: {created_at: @invoice1.created_at}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice1 = invoices.first
      invoice2 = invoices.last
      expect(invoices.count).to eq(2)
      expect(invoice1["id"]).to eq(@invoice1.id)
      expect(invoice2["id"]).to eq(@invoice2.id)
    end
    it "can find an invoice with updated_at param" do
      @invoice1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @invoice2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @invoice3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/invoices/find_all', params: {updated_at: @invoice1.updated_at}

      expect(response).to be_success
      invoices = JSON.parse(response.body)
      invoice1 = invoices.first
      invoice2 = invoices.last
      expect(invoices.count).to eq(3)
      expect(invoice1["id"]).to eq(@invoice1.id)
      expect(invoice2["id"]).to eq(@invoice3.id)
    end
  end
end
