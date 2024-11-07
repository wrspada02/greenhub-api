class FornecedorVenda < ApplicationRecord
  validates :preco, presence: true, numericality: { greater_than: 0 }
end
