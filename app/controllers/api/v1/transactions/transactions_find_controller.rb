class Api::V1::Transactions::TransactionsFindController < ApplicationController
  before_action :format_params

  def index
    @transactions = Transaction.where(search_params)
  end


  def show
    @transaction = Transaction.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end

end
