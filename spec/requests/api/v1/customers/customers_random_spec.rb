require 'rails_helper'

describe "find a random customer" do
  it "can provide a single random customer" do
      @customer1, @customer2, @customer3 = create_list(:customer, 3)

      get '/api/v1/customers/random'

      expect(response).to be_success
      customer = JSON.parse(response.body)
      expect(customer["id"]).to eq(@customer1.id) | eq(@customer2.id) | eq(@customer3.id)
      expect(customer["first_name"]).to eq(@customer1.first_name) | eq(@customer2.first_name) | eq(@customer3.first_name)
      expect(customer["last_name"]).to eq(@customer1.last_name) | eq(@customer2.last_name) | eq(@customer3.last_name)
  end
end
