class Api::V1::TransactionsController < Api::V1::ApiController
  def create
    card = Card.find_by(card_params)
    raise ActiveRecord::RecordNotFound if card.nil?

    transaction = Transaction.new(transaction_params)
    if transaction.save
      render status: 201, json: { status: transaction.status,
                                  message: 'Transação realizada com sucesso!' }
    else
      render status: 404, json: { errors: transaction.errors.full_messages }
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:number, :cpf, :value, :order)
  end

  def card_params
    params.require(:transaction).permit(:number, :cpf, :code, :name, :valid_date)
  end
end
