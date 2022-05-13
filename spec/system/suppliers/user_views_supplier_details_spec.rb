require 'rails_helper'

describe 'User see supplier details' do
  it 'from the main page' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Documento: 43447216000102')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('E-mail: contato@acme.com')
  end

  it 'and returns to the suppliers page' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'

    expect(current_path).to eq suppliers_path
  end
end