class Supplier < ApplicationRecord
  has_many :product_model
  validates :brand_name, :corporate_name, :email, :cnpj, presence: true
  validates :cnpj, uniqueness: true
  validates :cnpj, length: { is: 14 }
end
