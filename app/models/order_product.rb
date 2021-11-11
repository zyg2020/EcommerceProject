class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, :price, presence: true
  validates :price, :quantity, numericality: true
end
