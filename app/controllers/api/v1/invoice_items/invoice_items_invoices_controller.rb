class Api::V1::InvoiceItems::InvoiceItemsInvoicesController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params["invoice_item_id"])
    @invoice = invoice_item.invoice
  end

end
