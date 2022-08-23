require 'rails_helper'

describe 'admin generate new card' do
  it 'success' do
    visit root_path
    click_on 'Gerador de cartão'

    fill_in 'Name', with: 'Kilder Costa filho'
    fill_in 'CPF', with: '72318126434'


  end
end
