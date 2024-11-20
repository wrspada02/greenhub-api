class ProdutoPagamento < ApplicationRecord
  belongs_to :pagamento
  belongs_to :produto

  validates :quantidade, presence: true, numericality: { greater_than: 0 }
end
