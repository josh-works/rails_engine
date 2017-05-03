class Api::V1::Merchants::MerchantsFindController < ApplicationController

  def show
    binding.pry
    @merchant = Merchant.find_by(merchant_params)
  end

    private

    def merchant_params
      params.permit(:name, :id)
    end
end