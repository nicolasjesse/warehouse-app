require 'rails_helper'

describe 'Usuario visita tela inicial' do
    it 'e vê o nome da app' do
        # Arrange

        # Act
        visit(root_path)

        # Assert
        expect(page).to have_content('Galpões & Estoque')
    end

    it 'e vê os galpões cadastrados' do
        # Arrange
        Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                        address: 'Rio de Janeiro, 1000', CEP: '20000-000', description: 'Próximo ao andante')
        Warehouse.create(name: 'Maceió', code: 'MCZ', city: 'Maceió', area: 50_000,
                        address: 'Maceió, 4000', CEP: '50000-000', description: 'Próximo ao aeroporto')

        # Act
        visit(root_path)

        # Assert
        expect(page).not_to have_content('Não existem galpões cadastrados')
        expect(page).to have_content('Rio')
        expect(page).to have_content('Código: SDU')
        expect(page).to have_content('Cidade: Rio de Janeiro')
        expect(page).to have_content('60000 m2')

        expect(page).to have_content('Maceió')
        expect(page).to have_content('Código: MCZ')
        expect(page).to have_content('Cidade: Maceió')
        expect(page).to have_content('50000 m2')
    end

    it 'e não existem galpões cadastrados' do
        # Arrange

        # Act
        visit(root_path)

        # Assert
        expect(page).to have_content('Não existem galpões cadastrados')
    end
end