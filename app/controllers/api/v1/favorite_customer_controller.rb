class Api::V1::FavoriteCustomerController < ApplicationController

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @customer = @merchant.favorite_customer
  end
end
