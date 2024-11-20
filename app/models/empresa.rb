class Empresa < ApplicationRecord
  has_many :funcionarios, dependent: :destroy

  validates :nome, presence: true, length: { minimum: 10, maximum: 40 }
  validates :cnpj, :endereco, presence: true
end
