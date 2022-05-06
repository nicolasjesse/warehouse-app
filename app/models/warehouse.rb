class Warehouse < ApplicationRecord
  validates :name, :code, :city, :description, :address, :CEP, :area, presence: true
  validates :code, length: { is: 3 }
end
