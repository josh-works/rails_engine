class Api::V1::Merchants::MerchantPendingCustomersController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @customers = @merchant.pending_customers
  end

end
