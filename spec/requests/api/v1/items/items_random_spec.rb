require 'rails_helper'

describe "find a random item" do
  it "can provide a single random item" do
      @item1, @item2, @item3 = create_list(:item, 3)

      get '/api/v1/items/random'

      expect(response).to be_success
      item = JSON.parse(response.body)
      expect(item["id"]).to eq(@item1.id) | eq(@item2.id) | eq(@item3.id)
      expect(item["name"]).to eq(@item1.name) | eq(@item2.name) | eq(@item3.name)
      expect(item["description"]).to eq(@item1.description) | eq(@item2.description) | eq(@item3.description)
      expect(item["unit_price"]).to eq(@item1.format_unit_price) | eq(@item2.format_unit_price) | eq(@item3.format_unit_price)
  end
end
