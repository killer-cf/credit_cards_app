require 'rails_helper'

describe 'admin generate new card' do
  it 'success' do
    admin = create :admin

    login_as admin, scope: :admin
    visit root_path
    click_on 'Gerador de cartão'
    fill_in 'Nome', with: 'Kilder Costa filho'
    fill_in 'CPF', with: '72318126434'
    fill_in 'Limite', with: '500'
    click_on 'Gerar'

    expect(page).to have_content 'Cartão gerado com sucesso'
    expect(Card.count).to eq 1
    card = Card.last
    expect(card.name.nil?).to eq false
    expect(card.cpf.nil?).to eq false
    expect(card.number.nil?).to eq false
    expect(card.password.nil?).to eq false
    expect(card.code.nil?).to eq false
    expect(card.valid_date.nil?).to eq false
    expect(card.total_limit).to eq 500
    expect(card.available_limit).to eq 500
  end

  it 'with blank fields' do
    admin = create :admin

    login_as admin, scope: :admin
    visit root_path
    click_on 'Gerador de cartão'
    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    click_on 'Gerar'

    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'CPF não pode ficar em branco'
  end
end
