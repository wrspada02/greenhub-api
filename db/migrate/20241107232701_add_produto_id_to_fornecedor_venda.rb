class AddProdutoIdToFornecedorVenda < ActiveRecord::Migration[7.1]
  def change
    add_column :fornecedor_vendas, :produto_id, :integer
  end
end
