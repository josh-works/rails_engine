require 'rails_helper'

describe "items business intelligence" do
  it "returns the top x items ranked by total revenue generated" do
    invoice_items = create_list(:invoice_item, 10)
    item1 = invoice_items.first
    item2 = invoice_items.last
    item3 = invoice_items[5]

    invoice_items.each_with_index do |ii, n|
      ii.update(item_id: item1.id) if n < 7
      ii.update(item_id: item2.id) unless n < 7
    end

    invoice_items.last.item_id = item3.id

    x = 2

    get "/api/v1/items/most_revenue?quantity=#{x}"

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(item1.id)
    expect(items.last["id"]).to eq(item2.id)
    expect(items).to_not include(item3.id)
  end
end
