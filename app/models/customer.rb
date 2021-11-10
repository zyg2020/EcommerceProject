class Customer < ApplicationRecord
  # has_secure_password
  belongs_to :province
  has_many :orders

  validates :username, :password, :first_name, :last_name, :address, :city, :postal_code,
            :telephone, :country, :email, presence: true
end
