class Api::V1::Merchants::MerchantsController < ApplicationController

  def index
    render json: Merchant.all, only: [:id, :name]
  end

  def show
    render json: Merchant.find(params[:id]), only: [:id, :name]
  end

end
