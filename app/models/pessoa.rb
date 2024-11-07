class Pessoa < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 5, maximum: 30 }
  validates :cpf, presence: true

  belongs_to :funcionario
  belongs_to :fornecedor
end
