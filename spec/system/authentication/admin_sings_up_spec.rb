require 'rails_helper'

describe 'admin sings up' do
  it 'success' do
    visit root_path
    click_on 'Entrar'
    click_on 'Registrar-se'
    fill_in 'E-mail', with: 'kilder@example.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirmar senha', with: 'password'
    click_on 'Registrar'

    expect(page).to have_current_path root_path
    expect(page).to have_content('kilder@example.com')
  end

  it 'with blank fields' do
    visit new_admin_registration_path
    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirmar senha', with: ''
    click_on 'Registrar'

    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Senha não pode ficar em branco'
  end

  it 'with incorrect fields' do
    visit new_admin_registration_path
    fill_in 'E-mail', with: 'kilderexample.com'
    fill_in 'Senha', with: '123'
    fill_in 'Confirmar senha', with: '123'
    click_on 'Registrar'

    expect(page).to have_content 'Senha é muito curto (mínimo: 6 caracteres)'
    expect(page).to have_content 'E-mail não é válido'
  end
end
