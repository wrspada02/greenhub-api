class AddFornecedorIdToPessoa < ActiveRecord::Migration[7.1]
  def change
    add_column :pessoas, :fornecedor_id, :integer
  end
end
