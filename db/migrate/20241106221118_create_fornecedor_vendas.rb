class CreateFornecedorVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedor_vendas do |t|
      t.float :preco

      t.timestamps
    end
  end
end
