require 'rails_helper'

describe "find an item with params" do
  context "search using valid params" do
    before :each do
      @item1, @item2, @item3 = create_list(:item, 3)
    end
    it "can find an item with id params" do
      get '/api/v1/items/find_all', params: {id: @item1.id}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item = items.first
      expect(items.count).to eq(1)
      expect(item["id"]).to eq(@item1.id)
      expect(item["name"]).to eq(@item1.name)
      expect(item["description"]).to eq(@item1.description)
      expect(item["unit_price"]).to eq(@item1.unit_price)
    end
    it "can find an item with name params" do
      @item1.update(name: "Test")
      @item2.update(name: "Test")

      get '/api/v1/items/find_all', params: {name: @item1.name}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      item2 = items.last
      expect(items.count).to eq(2)
      expect(item1["id"]).to eq(@item1.id)
      expect(item2["id"]).to eq(@item2.id)
    end
    it "can find an item with description params" do
      @item1.update(description: "Spongebob Squarepants")
      @item3.update(description: "Spongebob Squarepants")

      get '/api/v1/items/find_all', params: {description: @item1.description}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      item2 = items.last
      expect(items.count).to eq(2)
      expect(item1["id"]).to eq(@item1.id)
      expect(item2["id"]).to eq(@item3.id)
    end
    it "can find an item with unit price param" do
      price = @item2.format_unit_price
      @item3.update(unit_price: @item2.unit_price)

      get '/api/v1/items/find_all', params: {unit_price: price}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      item2 = items.last
      expect(items.count).to eq(2)
      expect(item1["id"]).to eq(@item2.id)
      expect(item2["id"]).to eq(@item3.id)
    end
    it "can find an item with created_at param" do
      @item1.update(created_at: "2012-03-27T14:54:03.000Z")
      @item2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/items/find_all', params: {created_at: @item1.created_at}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      item2 = items.last
      expect(items.count).to eq(2)
      expect(item1["id"]).to eq(@item1.id)
      expect(item2["id"]).to eq(@item2.id)
    end
    it "can find an item with updated_at param" do
      @item1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @item2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @item3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/items/find_all', params: {updated_at: @item1.updated_at}

      expect(response).to be_success
      items = JSON.parse(response.body)
      item1 = items.first
      item2 = items.last
      expect(items.count).to eq(3)
      expect(item1["id"]).to eq(@item1.id)
      expect(item2["id"]).to eq(@item3.id)
    end
  end
end
