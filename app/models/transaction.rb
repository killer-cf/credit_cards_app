class Transaction < ApplicationRecord
  enum status: { accepted: 0, rejected: 5, pending: 9 }

  after_create :checks_and_update_limit

  private

  def checks_and_update_limit
    card = Card.find_by(number:)
    return if valid_date_is_future?(card.valid_date)

    has_limit?(card)
  end

  def valid_date_is_future?(valid_date)
    return unless valid_date < Date.today

    rejected!
  end

  def has_limit?(card)
    if card.available_limit < value
      rejected!
    else
      card.available_limit -= value
      card.save
    end
  end
end
