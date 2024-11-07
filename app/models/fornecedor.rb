class Fornecedor < ApplicationRecord
  has_one :pessoa
  has_many :fornecedor_vendas 
end
