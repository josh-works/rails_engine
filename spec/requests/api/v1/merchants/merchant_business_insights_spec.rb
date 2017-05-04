require 'rails_helper'

describe "merchant business insight endpoints" do
  before :each do
    @customer1, @customer2 = create_list(:customer_with_many_invoices, 2)
  end
  xit "returns collection of merchant's customers with pending invoices" do
    # returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
    @failed_invoice = @customer1.invoices.last
    @failed_invoice.transactions.each {|t| t.update(result: "failed")}
    @id = @failed_invoice.merchant.id
    # @customer2.invoices[2].transactions.each {|t| t.update(result: "failed")}

    get "/api/v1/merchants/#{@id}/customers_with_pending_invoices"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    customer = invoices.first
    expect(customers.count).to eq(1)
    expect(customer["id"]).to eq(@customer1.id)
    # display the pending invoices?
    # expect(customer["customer_id"]).to eq(invoice1.customer_id)
    # expect(customer["status"]).to eq(invoice1.status)
  end
  it "returns a merchant's customer with most transactions" do
    @merchant = @customer1.invoices[2].merchant
    @id = @merchant.id
    @customer1.invoices.each {|i| i.update(merchant: @merchant)}
    @customer2.invoices[2].update(merchant: @merchant)

    get "/api/v1/merchants/#{@id}/favorite_customer"

    expect(response).to be_success
    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(@customer1.id)
    expect(customer["total_transactions"]).to eq(@customer1.transactions.count)
    expect(customer["first_name"]).to eq(@customer1.first_name)
    expect(customer["last_name"]).to eq(@customer1.last_name)
  end

  it "returns total revenue for merchant" do
    merchant_1 = create(:merchant_with_invoices_and_items)

    get "/api/v1/merchants/#{merchant_1.id}/revenue"

    expect(response).to be_success

    revenue = JSON.parse(response.body)

    expect(revenue["revenue"]).to eq("120.00")
  end

  it "returns total revenue for specific merchant on specific date" do
    merchant_1 = create(:merchant_with_invoices_and_items)
    merchant_1.invoices.first.update(created_at: DateTime.yesterday)

    invoice_date_time = merchant_1.invoices.last.created_at.strftime("%Y-%m-%d %H:%M:%S")

    get "/api/v1/merchants/#{merchant_1.id}/revenue", params: {date: invoice_date_time}

    expect(response).to be_success
    revenue = JSON.parse(response.body)

    expect(revenue["revenue"]).to eq("80.00")
  end


end
