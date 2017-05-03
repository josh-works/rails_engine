class Api::V1::Items::ItemsRandomController < ApplicationController

  def show
    id = Item.pluck(:id).sample
    @item = Item.find(id)
  end

end
