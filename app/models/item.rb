class Item < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  validates :name, :description, :unit_price, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def format_unit_price
    number_to_currency(unit_price/100.00, precision: 2, unit: "")
  end

  def format_date_to_string(arg)
    binding.pry
  end

end
