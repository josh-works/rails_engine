class Api::V1::Merchants::RevenueByMerchantController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    if params[:date]
      @revenue = merchant.revenue_by_date(params[:date])
    else
      @revenue = merchant.revenue
    end
  end

end
