require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    it 'false when ONLY name is empty' do
      warehouse = Warehouse.new(name: '', code: 'ABC', address: 'Address',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: 'Some description')

      expect(warehouse).not_to be_valid
    end

    it 'false when ONLY code is empty' do
      warehouse = Warehouse.new(name: 'Name', code: '', address: 'Address',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: 'Some description')
                                
      expect(warehouse).not_to be_valid
    end

    it 'false when ONLY address is empty' do
      warehouse = Warehouse.new(name: 'Name', code: 'ABC', address: '',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: 'Some description')
                                
      expect(warehouse).not_to be_valid
    end

    it 'false when ONLY CEP is empty' do
      warehouse = Warehouse.new(name: 'Name', code: 'ABC', address: 'Address',
                                CEP: '', city: 'City', area: 1000,
                                description: 'Some description')
                                
      expect(warehouse).not_to be_valid
    end

    it 'false when ONLY city is empty' do
      warehouse = Warehouse.new(name: 'Name', code: 'ABC', address: 'Address',
                                CEP: '10000-000', city: '', area: 1000,
                                description: 'Some description')
                                
      expect(warehouse).not_to be_valid
    end

    it 'false when ONLY description is empty' do
      warehouse = Warehouse.new(name: 'Name', code: 'ABC', address: 'Address',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: '')
                                
      expect(warehouse).not_to be_valid
    end

    it 'false when code length > 3' do
      warehouse = Warehouse.new(name: 'Name', code: 'ABCD', address: 'Address',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: 'Some description')
      
      expect(warehouse).not_to be_valid
    end

    it 'false when code length < 3' do
      warehouse = Warehouse.new(name: 'Name', code: 'AB', address: 'Address',
                                CEP: '10000-000', city: 'City', area: 1000,
                                description: 'Some description')
      
      expect(warehouse).not_to be_valid
    end

    it 'false when code is already in use' do
      first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Address',
                                         CEP: '25000-000', city: 'Rio', area: 1000,
                                         description: 'Some description')

      second_warehouse = Warehouse.new(name: 'Niteroi', code: 'RIO', address: 'Other one',
                                          CEP: '45000-000', city: 'Niteroi', area: 3000,
                                          description: 'Some other description')        

      expect(second_warehouse).to_not be_valid
    end
  end
end
