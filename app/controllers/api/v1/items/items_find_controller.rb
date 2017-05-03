class Api::V1::Items::ItemsFindController < ApplicationController

  def show
    @item = Item.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end

end
