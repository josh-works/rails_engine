class Api::V1::Invoices::InvoiceInvoiceItemsController < ApplicationController

  def index
    invoice = Invoice.find(params["invoice_id"])
    @invoice_items = invoice.invoice_items
  end

end
