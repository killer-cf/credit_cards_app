class Card < ApplicationRecord
  validates :name, :cpf, :number, :code, :valid_date, :password, presence: true

  before_validation :generate_password, :generate_number, :generate_code, :generate_valid_date, on: :create

  private

  def generate_password
    self.password = SecureRandom.random_number(10**4).to_s.rjust(4, '0')
  end

  def generate_number
    self.number = SecureRandom.random_number(10**16).to_s.rjust(16, '0')
  end

  def generate_code
    self.code = SecureRandom.random_number(10**3).to_s.rjust(3, '0')
  end

  def generate_valid_date
    self.valid_date = 5.years.from_now.to_date
  end
end
