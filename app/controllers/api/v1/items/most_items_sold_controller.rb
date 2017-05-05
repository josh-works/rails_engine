class Api::V1::Items::MostItemsSoldController < ApplicationController

  def index
    @items = Item.top_by_number_sold(params[:quantity])
  end

end
