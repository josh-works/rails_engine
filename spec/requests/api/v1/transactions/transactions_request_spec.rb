require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)
    transaction_1 = Transaction.first
    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)
    transaction = transactions.first
    expect(transactions.count).to eq(3)
    expect(transaction).to have_key("id")
    expect(transaction["result"]).to eq(transaction_1.result)
  end

  it "can get one transaction by id" do
    transaction_1 = create(:transaction)
    id = transaction_1.id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)
    expect(response).to be_success

    expect(transaction["id"]).to eq(id)
    expect(transaction["result"]).to eq(transaction_1.result)
  end
end
