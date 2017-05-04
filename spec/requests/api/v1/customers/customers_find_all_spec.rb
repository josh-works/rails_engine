require 'rails_helper'

describe "find many customers with params" do
  context "search using valid params" do
    before :each do
      @customer1, @customer2, @customer3 = create_list(:customer, 3)
    end
    it "can find an customer with id params" do
      get '/api/v1/customers/find_all', params: {id: @customer1.id}

      expect(response).to be_success
      customers = JSON.parse(response.body)
      customer = customers.first
      expect(customers.count).to eq(1)
      expect(customer["id"]).to eq(@customer1.id)
      expect(customer["first_name"]).to eq(@customer1.first_name)
      expect(customer["last_name"]).to eq(@customer1.last_name)
    end
    it "can find an customer with first_name params" do
      @customer1.update(first_name: "Test")
      @customer2.update(first_name: "Test")

      get '/api/v1/customers/find_all', params: {first_name: @customer1.first_name}

      expect(response).to be_success
      customers = JSON.parse(response.body)
      customer1 = customers.first
      customer2 = customers.last
      expect(customers.count).to eq(2)
      expect(customer1["id"]).to eq(@customer1.id)
      expect(customer2["id"]).to eq(@customer2.id)
    end
    it "can find an customer with last_name params" do
      @customer1.update(last_name: "Test")
      @customer2.update(last_name: "Test")

      get '/api/v1/customers/find_all', params: {last_name: @customer1.last_name}

      expect(response).to be_success
      customers = JSON.parse(response.body)
      customer1 = customers.first
      customer2 = customers.last
      expect(customers.count).to eq(2)
      expect(customer1["id"]).to eq(@customer1.id)
      expect(customer2["id"]).to eq(@customer2.id)
    end
    it "can find an customer with created_at param" do
      @customer1.update(created_at: "2012-03-27T14:54:03.000Z")
      @customer2.update(created_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/customers/find_all', params: {created_at: @customer1.created_at}

      expect(response).to be_success
      customers = JSON.parse(response.body)
      customer1 = customers.first
      customer2 = customers.last
      expect(customers.count).to eq(2)
      expect(customer1["id"]).to eq(@customer1.id)
      expect(customer2["id"]).to eq(@customer2.id)
    end
    it "can find an customer with updated_at param" do
      @customer1.update(updated_at: "2012-03-27T14:54:03.000Z")
      @customer2.update(updated_at: "2012-03-27T14:54:03.000Z")
      @customer3.update(updated_at: "2012-03-27T14:54:03.000Z")

      get '/api/v1/customers/find_all', params: {updated_at: @customer1.updated_at}

      expect(response).to be_success
      customers = JSON.parse(response.body)
      customer1 = customers.first
      customer2 = customers.last
      expect(customers.count).to eq(3)
      expect(customer1["id"]).to eq(@customer1.id)
      expect(customer2["id"]).to eq(@customer3.id)
    end
  end
end
