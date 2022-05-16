require 'rails_helper'

describe 'User register a product model' do
  it 'successfully' do
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA',
                                registration_number: '3123123', full_address: 'Av Nac Unidas, 100',
                                city: 'Sao Paulo', state: 'SP', email: 'sac@samsung.com.br')

    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'

    fill_in 'Nome', with: 'TV LED 40 polegadas'
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'SKU', with: 'TV40-SAMS-XPT0'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
    expect(page).to have_content 'TV LED 40 polegadas'
    expect(page).to have_content 'Fornecedor: Samsung'
    expect(page).to have_content 'SKU: TV40-SAMS-XPT0'
    expect(page).to have_content 'Dimensão: 60cm x 90cm x 10cm'
    expect(page).to have_content 'Peso: 10000g'
  end
end