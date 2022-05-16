class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :weight, :width, :height, :depth, :sku, presence: true
  validates :sku, uniqueness: true
  validates :sku, length: { is: 20 }
  validates :weight, :width, :height, :depth, comparison: { greater_than_or_equal_to: 0 }
end
