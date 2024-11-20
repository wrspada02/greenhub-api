class AddPagamentoIdToProdutoPagamento < ActiveRecord::Migration[7.1]
  def change
    add_reference :produto_pagamentos, :pagamento, foreign_key: true
  end
end
