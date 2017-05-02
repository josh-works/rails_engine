class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.all, only: [:id, :first_name, :last_name]
  end

  def show
    render json: Customer.find(params["id"]), only: [:id, :first_name, :last_name]
  end

end
