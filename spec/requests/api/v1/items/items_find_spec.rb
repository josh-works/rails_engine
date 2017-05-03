require 'rails_helper'

describe "find an item with params" do
  context "search using valid params" do
    before :each do
      @item = create(:item)
    end
    it "can find an item with id params" do
      get '/api/v1/items/find', params: {id: @item.id}
    end
    it "can find an item with name params" do
      get '/api/v1/items/find', params: {name: @item.name}
    end
    it "can find an item with description params" do
      get '/api/v1/items/find', params: {description: @item.description}
    end
    it "can find an item with unit price param" do
      get '/api/v1/items/find', params: {unit_price: @item.unit_price}
    end
    xit "can find an item with created_at param" do
      get '/api/v1/items/find', params: {created_at: @item.created_at}
    end
    xit "can find an item with updated_at param" do
      get '/api/v1/items/find', params: {updated_at: @item.updated_at}
    end
    after :each do
      expect(response).to be_success
      item = JSON.parse(response.body)
      expect(item["id"]).to eq(@item.id)
      expect(item["name"]).to eq(@item.name)
      expect(item["description"]).to eq(@item.description)
      expect(item["unit_price"]).to eq(@item.unit_price)
    end
  end
  context "using invalid param values" do
    xit "returns 404 when trying to find by id" do
      get '/api/v1/items/find', params: {id: 14}
    end
    xit "returns 404 when trying to find by name" do
      get '/api/v1/items/find', params: {name: "Hello"}
    end
    xit "returns 404 when trying to find by description" do
      get '/api/v1/items/find', params: {description: "How goes it?"}
    end
    xit "returns 404 when trying to find by unit price" do
      get '/api/v1/items/find', params: {unit_price: 100000000}
    end
    xit "returns 404 when trying to find by created at date" do
      get '/api/v1/items/find', params: {created_at: Date.today}
    end
    xit "returns 404 when trying to find by updated at date" do
      get '/api/v1/items/find', params: {updated_at: Date.today}
    end
    after :each do
      # expect(response).to be_success
      # item = JSON.parse(response.body)
      # expect(item["id"]).to eq(@item.id)
      # expect(item["name"]).to eq(@item.name)
      # expect(item["description"]).to eq(@item.description)
      # expect(item["unit_price"]).to eq(@item.unit_price)
    end
  end
  context "using invalid param keys" do

  end
end
