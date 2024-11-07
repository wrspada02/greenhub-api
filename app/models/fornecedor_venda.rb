class FornecedorVenda < ApplicationRecord
  belongs_to :fornecedor
  belongs_to :produto

  validates :preco, presence: true, numericality: { greater_than: 0 }
end
