require 'rails_helper'

RSpec.describe Produto, type: :model do
  let(:produto) { build(:produto) }

  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:peso) }
    it { is_expected.to validate_numericality_of(:peso).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:tipo) }
    it { is_expected.to validate_presence_of(:nome) }
  end
end