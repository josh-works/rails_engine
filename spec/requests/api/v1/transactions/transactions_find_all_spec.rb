require 'rails_helper'

describe "find many transactions with params" do
  context "search using valid params" do
    before :each do
      @transaction1, @transaction2, @transaction3 = create_list(:transaction, 3)
    end
    it "can find an transaction with id params" do
      get '/api/v1/transactions/find_all', params: {id: @transaction1.id}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction = transactions.first
      expect(transactions.count).to eq(1)
      expect(transaction["id"]).to eq(@transaction1.id)
      expect(transaction["invoice_id"]).to eq(@transaction1.invoice_id)
      expect(transaction["credit_card_number"]).to eq(@transaction1.credit_card_number)
      expect(transaction["result"]).to eq(@transaction1.result)
    end
    it "can find an transaction with invoice_id params" do
      @transaction1.update(invoice_id: 1)
      @transaction2.update(invoice_id: 1)

      get '/api/v1/transactions/find_all', params: {invoice_id: @transaction1.invoice_id}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction1 = transactions.first
      transaction2 = transactions.last
      expect(transactions.count).to eq(2)
      expect(transaction1["id"]).to eq(@transaction1.id)
      expect(transaction2["id"]).to eq(@transaction2.id)
    end
    it "can find an transaction with credit_card_number params" do
      @transaction1.update(credit_card_number: 1)
      @transaction2.update(credit_card_number: 1)

      get '/api/v1/transactions/find_all', params: {credit_card_number: @transaction1.credit_card_number}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction1 = transactions.first
      transaction2 = transactions.last
      expect(transactions.count).to eq(2)
      expect(transaction1["id"]).to eq(@transaction1.id)
      expect(transaction2["id"]).to eq(@transaction2.id)
    end
    it "can find an transaction with result params" do
      @transaction1.update(result: "Test")
      @transaction2.update(result: "Test")

      get '/api/v1/transactions/find_all', params: {result: @transaction1.result}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction1 = transactions.first
      transaction2 = transactions.last
      expect(transactions.count).to eq(2)
      expect(transaction1["id"]).to eq(@transaction1.id)
      expect(transaction2["id"]).to eq(@transaction2.id)
    end
    it "can find an transaction with created_at param" do
      @transaction1.update(created_at: "2012-03-27T14:54:03.000Z")
      @transaction2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/transactions/find_all', params: {created_at: @transaction1.created_at}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction1 = transactions.first
      transaction2 = transactions.last
      expect(transactions.count).to eq(2)
      expect(transaction1["id"]).to eq(@transaction1.id)
      expect(transaction2["id"]).to eq(@transaction2.id)
    end
    it "can find an transaction with updated_at param" do
      @transaction1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @transaction2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @transaction3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/transactions/find_all', params: {updated_at: @transaction1.updated_at}

      expect(response).to be_success
      transactions = JSON.parse(response.body)
      transaction1 = transactions.first
      transaction2 = transactions.last
      expect(transactions.count).to eq(3)
      expect(transaction1["id"]).to eq(@transaction1.id)
      expect(transaction2["id"]).to eq(@transaction3.id)
    end
  end
end
