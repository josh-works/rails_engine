class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @customer = @merchant.favorite_customer
  end
end
