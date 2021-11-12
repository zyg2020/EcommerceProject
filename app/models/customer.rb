class Customer < ApplicationRecord
  attr_accessor :password

  # has_secure_password
  belongs_to :province
  has_many :orders

  validates :username, :first_name, :last_name, :address, :city, :postal_code,
            :telephone, :country, :email, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true, on: :create

  before_validation(on: :create) do
    encrypt_password
  end

  def authenticate(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
