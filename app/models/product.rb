class Product < ApplicationRecord
  has_one_attached :image

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :description, :price, presence: true
  validates :price, numericality: true
end
