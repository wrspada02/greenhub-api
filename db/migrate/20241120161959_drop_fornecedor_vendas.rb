class DropFornecedorVendas < ActiveRecord::Migration[7.1]
  def change
    drop_table :fornecedor_vendas 
  end
end
