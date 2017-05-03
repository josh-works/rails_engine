class Api::V1::Invoices::InvoicesFindController < ApplicationController
  before_action :format_params

  def index
    @invoices = Invoice.where(search_params)
  end


  def show
    @invoice = Invoice.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :customer_id,
                  :merchant_id,
                  :status,
                  :created_at,
                  :updated_at)
  end

end
