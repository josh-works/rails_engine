class Api::V1::InvoiceItems::InvoiceItemsFindController < ApplicationController
  before_action :format_params

  def index
    @invoice_items = InvoiceItem.where(search_params)
  end


  def show
    @invoice_item = InvoiceItem.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :item_id,
                  :invoice_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end

end
