require 'rails_helper'

describe 'User see product models' do
  it 'from the main page' do
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    expect(current_path).to eq product_models_path
  end

  it 'successfully' do
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA',
                                registration_number: '3123123', full_address: 'Av Nac Unidas, 100',
                                city: 'Sao Paulo', state: 'SP', email: 'sac@samsung.com.br',
                                cnpj: '78607805000195')
                                
    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45,
                         depth: 10, sku: 'TV32-SAMS-XPT0485968', supplier: supplier)
    ProductModel.create!(name: 'SoundBar 7.1', weight: '3000', width: 80, height: 15,
                         depth: 20, sku: 'SOU7-SAMS-XPT0485968', supplier: supplier)

    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'TV32-SAMS-XPT0485968'
    expect(page).to have_content 'SoundBar 7.1'
    expect(page).to have_content 'SOU7-SAMS-XPT0485968'
    expect(page).to have_content 'Samsung'
  end

  it 'without products registered' do
    visit root_path
    click_on 'Modelos de Produtos'

    expect(page).to have_content 'Nenhum modelo de produto cadastrado.'
  end
end