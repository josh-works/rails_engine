require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(merchants.count).to eq(3)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
  end

  it "can get one merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchant["id"]).to eq(id)
  end

end
