class Api::V1::Invoices::InvoiceCustomersController < ApplicationController

  def show
    invoice = Invoice.find(params["invoice_id"])
    @customer = invoice.customer
  end

end
