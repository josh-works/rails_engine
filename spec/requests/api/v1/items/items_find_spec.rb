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
      price = @item.format_unit_price
      get '/api/v1/items/find', params: {unit_price: price}
    end
    it "can find an item with created_at param" do
      @item.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/items/find', params: {created_at: @item.created_at}
    end
    it "can find an item with updated_at param" do
      @item.update(updated_at: "2012-03-27T14:54:03.000Z")
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
end
