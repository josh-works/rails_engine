class Api::V1::Merchants::MerchantsMostRevenueController < ApplicationController

  def index
    @merchants = Merchant.most_revenue(params[:quantity])
  end

end
