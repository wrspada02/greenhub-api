require 'rails_helper'

RSpec.describe Fornecedor, type: :model do
  let(:fornecedor) { build(:fornecedor) }

  describe 'associations' do
    it { is_expected.to have_one(:pessoa) }
    it { is_expected.to have_many(:fornecedor_vendas) }
  end
end
