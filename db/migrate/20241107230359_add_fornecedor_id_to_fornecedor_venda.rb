class AddFornecedorIdToFornecedorVenda < ActiveRecord::Migration[7.1]
  def change
    add_column :fornecedor_vendas, :fornecedor_id, :integer
  end
end
