require 'rails_helper'

RSpec.describe ProdutoPagamento, type: :model do
  let(:produto_pagamento) { build(:produto_pagamento) }

  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:quantidade) }
    it { is_expected.to validate_numericality_of(:quantidade).is_greater_than(0) }
  end
end
