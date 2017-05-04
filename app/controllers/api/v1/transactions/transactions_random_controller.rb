class Api::V1::Transactions::TransactionsRandomController < ApplicationController

  def show
    @transaction = Transaction.random
  end

end
