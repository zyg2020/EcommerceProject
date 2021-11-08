json.extract! customer, :id, :username, :password, :first_name, :last_name, :address, :city, :province_id, :postal_code, :telephone, :country, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
