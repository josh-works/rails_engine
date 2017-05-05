class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    @revenue = Merchant.total_by_date(params[:date])
  end

end
