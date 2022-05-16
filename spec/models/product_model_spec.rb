require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA',
                                  registration_number: '3123123', full_address: 'Av Nac Unidas, 100',
                                  city: 'Sao Paulo', state: 'SP', email: 'sac@samsung.com.br',
                                  cnpj: '16285608000140')
        
      pm = ProductModel.new(name: '', weight: 8000, width: 70, height: 45,
                           depth: 10, sku: 'TV32-SAMSU-XPT090', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end

    it 'sku is mandatory' do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA',
                                  registration_number: '3123123', full_address: 'Av Nac Unidas, 100',
                                  city: 'Sao Paulo', state: 'SP', email: 'sac@samsung.com.br',
                                  cnpj: '02583205000172')
        
      pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45,
                           depth: 10, sku: '', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end
  end
end
