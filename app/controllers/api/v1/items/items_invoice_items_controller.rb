class Api::V1::Items::ItemsInvoiceItemsController < ApplicationController

  def index
    item = Item.find(params["item_id"])
    @invoice_items = item.invoice_items
  end

end
