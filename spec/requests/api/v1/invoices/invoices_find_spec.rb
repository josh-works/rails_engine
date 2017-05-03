require 'rails_helper'

describe "find an invoice with params" do
  context "search using valid params" do
    before :each do
      @invoice = create(:invoice)
    end
    it "can find an invoice with id params" do
      get '/api/v1/invoices/find', params: {id: @invoice.id}
    end
    it "can find an invoice with customer id params" do
      get '/api/v1/invoices/find', params: {customer_id: @invoice.customer_id}
    end
    it "can find an invoice with merchant id params" do
      get '/api/v1/invoices/find', params: {merchant_id: @invoice.merchant_id}
    end
    it "can find an invoice with status param" do
      get '/api/v1/invoices/find', params: {status: @invoice.status}
    end
    it "can find an invoice with created_at param" do
      @invoice.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/invoices/find', params: {created_at: @invoice.created_at}
    end
    it "can find an invoice with updated_at param" do
      @invoice.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/invoices/find', params: {updated_at: @invoice.updated_at}
    end
    after :each do
      expect(response).to be_success
      invoice = JSON.parse(response.body)
      expect(invoice["id"]).to eq(@invoice.id)
      expect(invoice["status"]).to eq(@invoice.status)
      expect(invoice["customer_id"]).to eq(@invoice.customer_id)
      expect(invoice["merchant_id"]).to eq(@invoice.merchant_id)
    end
  end
end
