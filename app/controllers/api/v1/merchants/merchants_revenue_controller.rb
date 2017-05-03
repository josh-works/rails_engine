class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    @merchant = Merchant.find_by(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id)
  end

end
