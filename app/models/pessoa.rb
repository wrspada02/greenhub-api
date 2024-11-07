class Pessoa < ApplicationRecord
  has_one :funcionario, dependent: :destroy

  validates :nome, presence: true, length: { minimum: 5, maximum: 30 }
  validates :cpf, presence: true
end
