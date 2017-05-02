class Api::V1::TransactionsController < ApplicationController

  def index
    render json: Transaction.all, only: [:id, :result]
  end

  def show
    render json: Transaction.find(params["id"]), only: [:id, :result]
  end

end
