class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    card_params = params.require(:card).permit(:name, :cpf, :total_limit)
    @card = Card.new(card_params)
    if @card.save
      redirect_to root_path, notice: 'Cartão gerado com sucesso'
    else
      flash.now[:notice] = 'Falha ao criar cartão'
      render :new
    end
  end
end
