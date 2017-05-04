class Api::V1::InvoiceItems::InvoiceItemsItemsController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params["invoice_item_id"])
    @item = invoice_item.item
  end

end
