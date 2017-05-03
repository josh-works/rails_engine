class Api::V1::InvoiceItems::InvoiceItemsRandomController < ApplicationController

  def show
    @invoice_item = InvoiceItem.random
  end

end
