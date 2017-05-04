require 'rails_helper'

describe "find many merchants with params" do
  context "search using valid params" do
    before :each do
      @merchant1, @merchant2, @merchant3 = create_list(:merchant, 3)
    end
    it "can find an merchant with id params" do
      get '/api/v1/merchants/find_all', params: {id: @merchant1.id}

      expect(response).to be_success
      merchants = JSON.parse(response.body)
      merchant = merchants.first
      expect(merchants.count).to eq(1)
      expect(merchant["id"]).to eq(@merchant1.id)
      expect(merchant["name"]).to eq(@merchant1.name)
    end
    it "can find an merchant with name params" do
      @merchant1.update(name: "Test")
      @merchant2.update(name: "Test")

      get '/api/v1/merchants/find_all', params: {name: @merchant1.name}

      expect(response).to be_success
      merchants = JSON.parse(response.body)
      merchant1 = merchants.first
      merchant2 = merchants.last
      expect(merchants.count).to eq(2)
      expect(merchant1["id"]).to eq(@merchant1.id)
      expect(merchant2["id"]).to eq(@merchant2.id)
    end
    it "can find an merchant with created_at param" do
      @merchant1.update(created_at: "2012-03-27T14:54:03.000Z")
      @merchant2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/merchants/find_all', params: {created_at: @merchant1.created_at}

      expect(response).to be_success
      merchants = JSON.parse(response.body)
      merchant1 = merchants.first
      merchant2 = merchants.last
      expect(merchants.count).to eq(2)
      expect(merchant1["id"]).to eq(@merchant1.id)
      expect(merchant2["id"]).to eq(@merchant2.id)
    end
    it "can find an merchant with updated_at param" do
      @merchant1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @merchant2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @merchant3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/merchants/find_all', params: {updated_at: @merchant1.updated_at}

      expect(response).to be_success
      merchants = JSON.parse(response.body)
      merchant1 = merchants.first
      merchant2 = merchants.last
      expect(merchants.count).to eq(3)
      expect(merchant1["id"]).to eq(@merchant1.id)
      expect(merchant2["id"]).to eq(@merchant3.id)
    end
  end
end
