require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    item_list = create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = items.first

    expect(items.count).to eq(3)
    expect(item["name"]).to eq(item_list.first.name)
  end
  
  it "can get one item by id" do
    item_1 = create(:item)
    id = item_1.id
    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["unit_price"]).to eq(item_1.format_unit_price)
  end
end
