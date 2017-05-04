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

end
