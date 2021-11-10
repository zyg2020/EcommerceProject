class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :order_products
  has_many :products, through: :order_products

  validates :customer, :status, presence: true
end
