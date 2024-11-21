require 'rails_helper'

RSpec.describe Pagamento, type: :model do
  let(:pagamento) { build(:pagamento) }

  describe 'associations' do
    it { is_expected.to have_many(:produto_pagamentos)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:tipo) }
  end
end
