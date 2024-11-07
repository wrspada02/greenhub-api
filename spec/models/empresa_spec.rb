require 'rails_helper'

RSpec.describe Empresa, type: :model do
  let(:empresa) { build(:empresa) }

  describe 'associations' do
    it { is_expected.to have_many(:funcionarios) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_length_of(:nome).is_at_least(10).is_at_most(40) }
    it { is_expected.to validate_presence_of(:cnpj) }
  end
end
