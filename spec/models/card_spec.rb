require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#valid' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:cpf) }

    it { is_expected.to validate_length_of(:cpf).is_equal_to(11) }

    it 'is expected presence of number' do
      card = described_class.new
      card.valid?

      expect(card.errors.include?(:number)).to be false
    end

    it 'is expected presence of code' do
      card = described_class.new
      card.valid?

      expect(card.errors.include?(:code)).to be false
    end

    it 'is expected presence of valid_date' do
      card = described_class.new
      card.valid?

      expect(card.errors.include?(:valid_date)).to be false
    end

    it 'is expected presence of password' do
      card = described_class.new
      card.valid?

      expect(card.errors.include?(:password)).to be false
    end

    it 'is expected length of number is iqual to 16' do
      card = described_class.new
      card.valid?

      expect(card.number.length).to eq 16
    end

    it 'is expected length of code is iqual to 3' do
      card = described_class.new
      card.valid?

      expect(card.code.to_s.length).to eq 3
    end

    it 'is expected length of password is iqual to 3' do
      card = described_class.new
      card.valid?

      expect(card.password.to_s.length).to eq 4
    end
  end
end
