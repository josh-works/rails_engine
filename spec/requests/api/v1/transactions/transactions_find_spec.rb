require 'rails_helper'

describe "find a transaction with params" do
  context "search using valid params" do
    before :each do
      @transaction = create(:transaction)
    end
    it "can find a transaction with id params" do
      get '/api/v1/transactions/find', params: {id: @transaction.id}
    end
    it "can find a transaction with invoice_id params" do
      get '/api/v1/transactions/find', params: {invoice_id: @transaction.invoice_id}
    end
    it "can find a transaction with credit_card_number params" do
      get '/api/v1/transactions/find', params: {credit_card_number: @transaction.credit_card_number}
    end
    it "can find a transaction with result params" do
      get '/api/v1/transactions/find', params: {result: @transaction.result}
    end
    it "can find a transaction with created_at param" do
      @transaction.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/transactions/find', params: {created_at: @transaction.created_at}
    end
    it "can find a transaction with updated_at param" do
      @transaction.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/transactions/find', params: {updated_at: @transaction.updated_at}
    end
    after :each do
      expect(response).to be_success
      transaction = JSON.parse(response.body)
      expect(transaction["id"]).to eq(@transaction.id)
      expect(transaction["invoice_id"]).to eq(@transaction.invoice_id)
      expect(transaction["credit_card_number"]).to eq(@transaction.credit_card_number)
      expect(transaction["result"]).to eq(@transaction.result)
    end
  end
end
