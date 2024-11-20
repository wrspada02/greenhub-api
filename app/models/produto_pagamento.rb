class ProdutoPagamento < ApplicationRecord
  validates :quantidade, presence: true, numericality: { greater_than: 0 }
end
