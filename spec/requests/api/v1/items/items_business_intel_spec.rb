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

  it "loads a variable number of top items ranked by total number sold" do
    invoice_items = create_list(:invoice_item, 10)
    invoice_items[1].update(item_id: 1)
    group_size_1 = 2

    get "/api/v1/items/most_items", params: {quantity: group_size_1}

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items.empty?).to be(false)
    item_1 = items.first

    expect(item_1["name"]).to eq(invoice_items.first.item.name)
    expect(item_1["id"]).to eq(invoice_items[0].item.id)
  end

  xit "loads the best day associated with one item" do
    item_1, item_2, item_3 = create_list(:invoices_with_items, 3)
    item_1.invoice_items.map do |ii|
      ii.update(created_at: DateTime.yesterday)
    end
    item_2.invoice_items.map do |ii|
      ii.update(created_at: DateTime.yesterday)
    end

    get "/api/v1/items/#{item_1.id}/best_day"

    expect(response).to be_success

    date = JSON.parse(response.body)

    expect(date["best_day"]).to eq(item_1.invoice_items.first.created_at)
  end


end
