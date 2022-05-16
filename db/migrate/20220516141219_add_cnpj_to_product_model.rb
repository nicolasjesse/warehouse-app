class AddCnpjToProductModel < ActiveRecord::Migration[7.0]
  def change
    add_column :product_models, :cnpj, :string
  end
end
