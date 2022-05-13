require 'rails_helper'

describe 'User deletes a warehouse' do
  it 'and succeed' do
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', CEP: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Remover'

    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).not_to have_content('Aeroporto SP')
    expect(page).not_to have_content('Código: GRU')
    expect(page).not_to have_content('Cidade: Guarulhos')
    expect(page).not_to have_content('Área: 100000 m2')
  end
end