class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def show
    @merchant = Merchant.find(params[:merchant_id])
  end

end
