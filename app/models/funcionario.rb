class Funcionario < ApplicationRecord
  belongs_to :empresa

  validates :nome, presence: true, length: { minimum: 10, maximum: 40 }
  validates :cpf, :endereco, presence: true
end
