class Product < ApplicationRecord
  has_one_attached :image

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :order_products
  has_many :orders, through: :order_products

  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :name, :description, :price, presence: true
  validates :price, numericality: true
end
