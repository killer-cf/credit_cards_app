class Transaction < ApplicationRecord
  enum status: { accepted: 0, rejected: 5, pending: 9 }
end
