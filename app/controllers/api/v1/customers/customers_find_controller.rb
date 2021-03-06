class Api::V1::Customers::CustomersFindController < ApplicationController
  before_action :format_params

  def index
    @customers = Customer.where(search_params)
  end


  def show
    @customer = Customer.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end

end
