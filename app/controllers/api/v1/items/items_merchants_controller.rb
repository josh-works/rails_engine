class Api::V1::Items::ItemsMerchantsController < ApplicationController

  def show
    item = Item.find(params["item_id"])
    @merchant = item.merchant
  end

end
