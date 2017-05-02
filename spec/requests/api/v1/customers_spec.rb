require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    person_1, person_2, person_3 = create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)
    customer_1 = customers.first
    customer_2 = customers.last

    expect(customers.count).to eq(3)
    expect(customer_1).to have_key("id")
    expect(customer_1).to have_key("first_name")
    expect(customer_1["first_name"]).to eq(person_1.first_name)
    expect(customer_2["first_name"]).to eq(person_3.first_name)
  end

  it "can get one customer by id" do
    customer_1 = create(:customer)

    get "/api/v1/customers/#{customer_1.id}"

    customer = JSON.parse(response.body)
    expect(response).to be_success

    expect(customer["id"]).to eq(customer_1.id)
    expect(customer["first_name"]).to eq(customer_1.first_name)
  end
end
