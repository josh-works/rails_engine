require 'rails_helper'

describe "find a random transaction" do
  it "can provide a single random transaction" do
      @transaction1, @transaction2, @transaction3 = create_list(:transaction, 3)

      get '/api/v1/transactions/random'

      expect(response).to be_success
      transaction = JSON.parse(response.body)
      expect(transaction["id"]).to eq(@transaction1.id) | eq(@transaction2.id) | eq(@transaction3.id)
      expect(transaction["invoice_id"]).to eq(@transaction1.invoice_id) | eq(@transaction2.invoice_id) | eq(@transaction3.invoice_id)
      expect(transaction["credit_card_number"]).to eq(@transaction1.credit_card_number) | eq(@transaction2.credit_card_number) | eq(@transaction3.credit_card_number)
      expect(transaction["result"]).to eq(@transaction1.result) | eq(@transaction2.result) | eq(@transaction3.result)
  end
end
