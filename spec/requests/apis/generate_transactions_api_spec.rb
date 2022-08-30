require 'rails_helper'

describe 'Transaction API' do
  context 'POST /api/v1/transactions' do
    it 'success and return approved if have limit' do
      card = create :card, total_limit: 2000, available_limit: 1000
      transaction = { transaction: { value: 200, order: 'ASDFG1234567', cpf: card.cpf, number: card.number,
                                     name: card.name, code: card.code, valid_date: card.valid_date } }

      post '/api/v1/transactions', params: transaction

      expect(response.status).to eq 201
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to include('accepted')
      expect(json_response['message']).to include('Transação realizada com sucesso!')
    end

    it 'fail if incompletes params' do
      create :card, total_limit: 2000, available_limit: 1000
      transaction = { transaction: { value: 200, order: 'ASDFG1234567', cpf: '', number: '',
                                     name: '', code: '', valid_date: '' } }

      post '/api/v1/transactions', params: transaction

      expect(response.status).to eq 404
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['errors']).to include('Cartão invalido, revise os dados')
    end

    it 'return reject if dont have limit' do
      card = create :card, total_limit: 1000
      transaction = { transaction: { value: 1500, order: 'ASDFG1234567', cpf: card.cpf, number: card.number,
                                     name: card.name, code: card.code, valid_date: card.valid_date } }

      post '/api/v1/transactions', params: transaction

      expect(response.status).to eq 201
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to include('rejected')
      expect(json_response['message']).to include('Transação realizada com sucesso!')
    end
  end
end
