class Warehouse < ApplicationRecord
  validates :name, :code, :city, :description, :address, :CEP, :area, presence: true
  validates :code, length: { is: 3 }
  validates :code, uniqueness: true
  validates :CEP, format: { with: /\A\d{5}-\d{3}\z/ }
end
