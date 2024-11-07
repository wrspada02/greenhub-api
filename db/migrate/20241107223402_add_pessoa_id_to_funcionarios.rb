class AddPessoaIdToFuncionarios < ActiveRecord::Migration[7.1]
  def change
    add_column :funcionarios, :pessoa_id, :integer
  end
end
