class Api::V1::Items::MostRevenueItemsController < ApplicationController

  def index
    @items = Item.most_revenue(params[:quantity])
  end

end
