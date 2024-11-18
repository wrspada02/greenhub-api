class AddNomeToProdutos < ActiveRecord::Migration[7.1]
  def change
    add_column :produtos, :nome, :string
  end
end
