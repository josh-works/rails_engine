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
    xit "can find an item with name params" do
      @item1.update(name: "Test")
      @item2.update(name: "Test")
      get '/api/v1/items/find_all', params: {name: @item1.name}
    end
    xit "can find an item with description params" do
      get '/api/v1/items/find', params: {description: @item.description}
    end
    xit "can find an item with unit price param" do
      price = @item.format_unit_price
      get '/api/v1/items/find', params: {unit_price: price}
    end
    xit "can find an item with created_at param" do
      @item.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/items/find', params: {created_at: @item.created_at}
    end
    xit "can find an item with updated_at param" do
      @item.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/items/find', params: {updated_at: @item.updated_at}
    end
    after :each do

    end
  end
end
