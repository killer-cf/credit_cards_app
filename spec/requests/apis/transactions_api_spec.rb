require 'rails_helper'

describe 'Transaction API' do
  context 'POST /api/v1/transactions' do
    it 'success' do
      card = create :card, total_limit: 2000, available_limit: 1000
      transaction = { transaction: { value: 200, order: 'ASDFG1234567', cpf: card.cpf, number: card.number,
                                     name: card.name, code: card.code, valid_date: card.valid_date } }

      post '/api/v1/transactions', params: transaction

      expect(response.status).to eq 201
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to include('accepted')
    end
  end
end
