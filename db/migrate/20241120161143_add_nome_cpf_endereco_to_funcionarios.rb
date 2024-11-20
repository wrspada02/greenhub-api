class AddNomeCpfEnderecoToFuncionarios < ActiveRecord::Migration[7.1]
  def change
    add_column :funcionarios, :nome, :string
    add_column :funcionarios, :cpf, :string
    add_column :funcionarios, :endereco, :string
  end
end
