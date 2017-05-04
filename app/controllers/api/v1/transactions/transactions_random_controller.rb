class Api::V1::Customers::CustomersRandomController < ApplicationController

  def show
    @transaction = Transaction.random
  end

end
