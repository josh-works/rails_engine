class Api::V1::Items::ItemsFindController < ApplicationController

  def index
    @items = Item.where(format_find_params(search_params))
  end

  def show
    @item = Item.find_by(format_find_params(search_params))
  end

  private

  def search_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  end

end
