class Api::V1::Transactions::TransactionInvoiceController < ApplicationController

  def show
    @transaction = Transaction.find(params[:transaction_id])
    @invoice = @transaction.invoice
  end

end
