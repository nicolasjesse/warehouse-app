require 'rails_helper'

describe 'User see suppliers' do
  it 'from the main page' do
    visit root_path
    click_on 'Fornecedores'

    expect(current_path).to eq suppliers_path
  end

  it 'successfully' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    Supplier.create!(corporate_name: 'Spark LTDA', brand_name: 'Spark', registration_number: '24347216000102',
                     full_address: 'Torre da Indústria, 1', city: 'Teresina', state: 'PI', email: 'contato@spark.com')

    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Bauru - SP')
    expect(page).to have_content('Spark')
    expect(page).to have_content('Teresina - PI')
  end

  it 'and theres no suppliers registered' do
    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Não existem fornecedores cadastrados'
  end
end