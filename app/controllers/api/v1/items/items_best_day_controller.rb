class Api::V1::Items::ItemsBestDayController < ApplicationController

  def show
    item = Item.find(params[:item_id])
    @best_day = item.best_day
  end

end
