class Empresa < ApplicationRecord
  has_many :funcionarios, dependent: :destroy
  has_many :pagamentos

  validates :nome, presence: true, length: { minimum: 10, maximum: 40 }
  validates :cnpj, presence: true
end
