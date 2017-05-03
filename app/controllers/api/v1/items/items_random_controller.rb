class Api::V1::Items::ItemsRandomController < ApplicationController

  def show
    @item = Item.random
  end

end
