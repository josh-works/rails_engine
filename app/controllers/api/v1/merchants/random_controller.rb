class Api::V1::Merchants::RandomController < ApplicationController

  def show
    @merchant = Merchant.random
  end

end
