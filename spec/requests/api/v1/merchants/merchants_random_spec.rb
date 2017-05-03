require 'rails_helper'

describe "find a random merchant" do
  it "can provide a single random merchant" do
      @merchant1, @merchant2, @merchant3 = create_list(:merchant, 3)

      get '/api/v1/merchants/random'

      expect(response).to be_success
      merchant = JSON.parse(response.body)
      expect(merchant["id"]).to eq(@merchant1.id) | eq(@merchant2.id) | eq(@merchant3.id)
      expect(merchant["name"]).to eq(@merchant1.name) | eq(@merchant2.name) | eq(@merchant3.name)
  end
end
