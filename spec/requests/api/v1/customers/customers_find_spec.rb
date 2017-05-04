require 'rails_helper'

describe "find a customer with params" do
  context "search using valid params" do
    before :each do
      @customer = create(:customer)
    end
    it "can find a customer with id params" do
      get '/api/v1/customers/find', params: {id: @customer.id}
    end
    it "can find a customer with first_name params" do
      get '/api/v1/customers/find', params: {name: @customer.first_name}
    end
    it "can find a customer with last_name params" do
      get '/api/v1/customers/find', params: {name: @customer.last_name}
    end
    it "can find a customer with created_at param" do
      @customer.update(created_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/customers/find', params: {created_at: @customer.created_at}
    end
    it "can find a customer with updated_at param" do
      @customer.update(updated_at: "2012-03-27T14:54:03.000Z")
      get '/api/v1/customers/find', params: {updated_at: @customer.updated_at}
    end
    after :each do
      expect(response).to be_success
      customer = JSON.parse(response.body)
      expect(customer["id"]).to eq(@customer.id)
      expect(customer["first_name"]).to eq(@customer.first_name)
      expect(customer["last_name"]).to eq(@customer.last_name)
    end
  end
end
