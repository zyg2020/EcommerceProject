class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true

  belongs_to :province
  # has_one :province, dependent: :destroy
  # accepts_nested_attributes_for :province

  # def province
  #   super || build_province
  # end
end
