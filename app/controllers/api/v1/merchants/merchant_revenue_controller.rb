class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    if params[:date]
      @revenue = merchant.revenue_by_date(params[:date])
    else
      @revenue = merchant.format_revenue
    end
  end

end
