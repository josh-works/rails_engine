class Api::V1::Invoices::InvoiceTransactionsController < ApplicationController

  def index
    invoice = Invoice.find(params["invoice_id"])
    @transactions = invoice.transactions
  end

end
