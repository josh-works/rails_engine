require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(customers.count).to eq(3)
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer["first_name"]).to eq("Lemony")
  end

  it "can get one customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)
    expect(response).to be_success

    expect(customer["id"]).to eq(id)
    expect(customer["first_name"]).to eq("Lemony")
  end
end
