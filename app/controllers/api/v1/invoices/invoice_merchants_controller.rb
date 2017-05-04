class Api::V1::Invoices::InvoiceMerchantsController < ApplicationController

  def show
    invoice = Invoice.find(params["invoice_id"])
    @merchant = invoice.merchant
  end

end
