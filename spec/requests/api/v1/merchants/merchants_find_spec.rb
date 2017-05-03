require 'rails_helper'

describe "find a merchant with params" do
  context "search using valid params" do
    before :each do
      @merchant = create(:merchant)
    end
    it "can find a merchant with id params" do
      get '/api/v1/merchants/find', params: {id: @merchant.id}
    end
    it "can find a merchant with name params" do
      get '/api/v1/merchants/find', params: {name: @merchant.name}
    end
    it "can find a merchant with created_at param" do
      @merchant.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/merchants/find', params: {created_at: @merchant.created_at}
    end
    it "can find a merchant with updated_at param" do
      @merchant.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/merchants/find', params: {updated_at: @merchant.updated_at}
    end
    after :each do
      expect(response).to be_success
      merchant = JSON.parse(response.body)
      expect(merchant["id"]).to eq(@merchant.id)
      expect(merchant["name"]).to eq(@merchant.name)
    end
  end
end
