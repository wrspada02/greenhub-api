class Empresa < ApplicationRecord
  has_many :funcionarios, dependent: :destroy

  has_many :vendas_pagamentos, foreign_key: :venda_id_empresa, class_name: "Pagamento"
  has_many :compras_pagamentos, foreign_key: :compra_id_empresa, class_name: "Pagamento"

  has_many :vendas, through: :vendas_pagamentos, source: :venda
  has_many :compras, through: :compras_pagamentos, source: :compra  

  validates :nome, presence: true, length: { minimum: 10, maximum: 40 }
  validates :cnpj, :endereco, presence: true
end
