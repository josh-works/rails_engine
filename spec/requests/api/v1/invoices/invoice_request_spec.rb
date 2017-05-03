require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    invoice_list = create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(invoices.count).to eq(3)
    expect(invoice["id"]).to eq(invoice_list.first.id)
    expect(invoice["status"]).to eq(invoice_list.first.status)
  end

  it "show a single invoice" do
    invoice_1 = create(:invoice)
    id = invoice_1.id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end
end
