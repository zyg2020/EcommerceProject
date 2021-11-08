json.extract! order_product, :id, :product_id, :order_id, :quantity, :price, :created_at, :updated_at
json.url order_product_url(order_product, format: :json)
