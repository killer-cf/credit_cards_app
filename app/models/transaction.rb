class Transaction < ApplicationRecord
  enum status: { accepted: 0, rejected: 5, pending: 9 }

  after_create :check_and_update_limit

  private

  def check_and_update_limit
    card = Card.find_by(number:)
    rejected! if card.available_limit < value
  end
end
