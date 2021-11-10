class Customer < ApplicationRecord
  # has_secure_password
  belongs_to :province

  validates :username, :password, :first_name, :last_name, :address, :city, :postal_code,
            :telephone, :country, :email, presence: true
end
