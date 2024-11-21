class Pagamento < ApplicationRecord
  has_many :produto_pagamentos

  belongs_to :venda, optional: true, foreign_key: :venda_id_empresa, class_name: "Empresa"
  belongs_to :compra, optional: true, foreign_key: :compra_id_empresa, class_name: "Empresa"

  validates :tipo, presence: true
end
