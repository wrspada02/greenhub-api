require 'rails_helper'

RSpec.describe Funcionario, type: :model do
  let(:funcionario) { build(:funcionario) }

  describe 'associations' do
    it { is_expected.to have_one(:pessoa) }
  end
end
