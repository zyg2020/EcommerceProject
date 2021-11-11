class Province < ApplicationRecord
  has_many :customers

  validates :name, presence: true
  # validates :HST, :PST, :GST, numericality: true
end
