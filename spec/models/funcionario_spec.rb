require 'rails_helper'

RSpec.describe Funcionario, type: :model do
  let(:funcionario) { build(:funcionario) }

  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_length_of(:nome).is_at_least(10).is_at_most(40) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:endereco) }
  end
end
