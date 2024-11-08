require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  let(:pessoa) { build(:empresa) }

  describe 'associations' do
    it { is_expected.to belong_to(:funcionario) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_length_of(:nome).is_at_least(5).is_at_most(30) }
    it { is_expected.to validate_presence_of(:cpf) }
  end
end
