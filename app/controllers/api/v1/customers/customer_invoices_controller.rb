class Api::V1::Customers::CustomerInvoicesController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @invoices = @customer.invoices
  end

end
