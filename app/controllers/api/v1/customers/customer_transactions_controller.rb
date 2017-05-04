class Api::V1::Customers::CustomerTransactionsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @transactions = @customer.transactions
  end

end
