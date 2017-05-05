class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices

  def self.random
    id = Merchant.pluck(:id).sample
    Merchant.find(id)
  end

  def items
    Item.where(merchant_id: id)
  end

  def pending_customers
    Customer.joins(invoices: :transactions).where('invoices.merchant_id = ?', id).pluck('transactions.result')
    binding.pry
  end

  def favorite_customer
    Customer.joins(invoices: :transactions)
            .where('invoices.merchant_id = ? AND transactions.result = ?', id, 'success')
            .group('customers.id')
            .order('count("transactions.id") DESC')
            .first
  end

  def revenue
    raw_revenue = invoices.joins(:invoice_items, :transactions).
    merge(Transaction.success).
    sum("unit_price * quantity")
    format_unit_price(raw_revenue)
  end

  def revenue_by_date(datetime)
    date = datetime.to_date
    raw_revenue = invoices.joins(:invoice_items, :transactions).
    where(invoices: {created_at: date.beginning_of_day..date.end_of_day}).
    merge(Transaction.success).
    sum("unit_price * quantity")
    format_unit_price(raw_revenue)
  end

  def self.total_by_date(datetime)
    raw_revenue = Invoice.joins(:invoice_items, :transactions).
    where(invoices: {created_at: datetime.to_datetime}).
    merge(Transaction.success).
    sum("unit_price * quantity")
    self.first.format_unit_price(raw_revenue)
  end

  def self.most_revenue(quantity)
    Merchant.joins(invoices: [:invoice_items, :transactions])
            .merge(Transaction.success)
            .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
            .group("merchants.id")
            .order("revenue DESC")
            .limit(quantity)
  end

end
