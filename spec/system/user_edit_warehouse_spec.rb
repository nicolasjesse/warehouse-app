require 'rails_helper'

describe 'User updates a warehouse' do
  it 'and see the form fields' do
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                              address: 'Avenida do Aeroporto, 1000', CEP: '15000-000',
                              description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field('Nome', with: 'Aeroporto SP')
    expect(page).to have_field('Código', with: 'GRU')
    expect(page).to have_field('Cidade', with: 'Guarulhos')
    expect(page).to have_field('Área', with: '100000')
    expect(page).to have_field('Endereço', with: 'Avenida do Aeroporto, 1000')
    expect(page).to have_field('CEP', with: '15000-000')
    expect(page).to have_field('Descrição', with: 'Galpão destinado para cargas internacionais')
  end

  it 'and change all fields to something' do
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', CEP: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Natal'
    fill_in 'Código', with: 'RNN'
    fill_in 'Área', with: '999'
    fill_in 'Endereço', with: 'Avenida Brasil'
    fill_in 'CEP', with: '90000-000'
    fill_in 'Descrição', with: 'Destinado apenas para cargas NACIONAIS'
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Detalhes de Galpão'
    expect(page).to have_content 'Nome: Natal'
    expect(page).to have_content 'RNN'
    expect(page).to have_content 'Cidade: Guarulhos'
    expect(page).to have_content 'Área: 999 m2'
    expect(page).to have_content 'Destinado apenas para cargas NACIONAIS'
    expect(page).to have_content 'CEP: 90000-000'
    expect(page).to have_content 'Endereço: Avenida Brasil'
  end

  it 'with empty inputs' do
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', CEP: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Código', with: ''
    fill_in 'Área', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'CEP', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Não foi possível atualizar o Galpão'
    expect(page).to have_content 'não pode ficar em branco'
    expect(page).to have_content 'não possui o tamanho esperado (3 caracteres)'
  end
end