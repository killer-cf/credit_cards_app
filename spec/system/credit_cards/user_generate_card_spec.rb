require 'rails_helper'

describe 'admin generate new card' do
  it 'success' do
    admin = create :admin

    login_as admin, scope: :admin
    visit root_path
    click_on 'Gerador de cartão'
    fill_in 'Name', with: 'Kilder Costa filho'
    fill_in 'CPF', with: '72318126434'
    click_on 'Gerar'

    expect(page).to have_content 'Cartão gerado com sucesso'
    expect(CreditCard.count).to eq 1
    card = CreditCard.last
    expect(card.name.any?).to eq true
    expect(card.cpf.any?).to eq true
    expect(card.number.any?).to eq true
    expect(card.password.any?).to eq true
    expect(card.code.any?).to eq true
    expect(card.valid.any?).to eq true
  end
end
