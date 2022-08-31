require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#valid?' do
    it { is_expected.to validate_presence_of(:status) }

    it { is_expected.to validate_presence_of(:value) }

    it { is_expected.to validate_presence_of(:order) }

    it { is_expected.to validate_presence_of(:cpf) }

    it { is_expected.to validate_presence_of(:number) }

    it { is_expected.to validate_numericality_of(:value) }
  end
end
