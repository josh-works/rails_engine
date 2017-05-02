class Merchant < ApplicationRecord

  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices

end
