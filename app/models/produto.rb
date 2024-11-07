class Produto < ApplicationRecord
  has_many :fornecedor_vendas

  validates :peso, presence: true, numericality: { greater_than: 0 }
  validates :tipo, presence: true
end
