class AddProdutoIdToProdutoPagamento < ActiveRecord::Migration[7.1]
  def change
    add_reference :produto_pagamentos, :produto, foreign_key: true
  end
end
