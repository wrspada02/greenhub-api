require 'rails_helper'

RSpec.describe Pagamento, type: :model do
  let(:pagamento) { build(:pagamento) }

  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:tipo) }
  end
end
